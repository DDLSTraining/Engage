<#
    .SYNOPSIS
    A full graceful telnet client using PowerShell and the .NET Framework.

    .DESCRIPTION
    This script was made with a view of using it to have full control over the text
    stream for automating Cisco router and switch configurations.

    .PARAMETER TelnetHost
    The address of the server or router hosting the telnet service.

    .PARAMETER Port
    The TCP port number of the Telnet service running on the Telnet host.
#>

param
(
    [parameter(Mandatory)]
    [String]
    $TelnetHost,
    
    [Int]
    $Port = 23
)

# Initialize variables
[System.Text.ASCIIEncoding]$ASCIIEncoding = [System.Text.Encoding]::ASCII
[System.Net.Sockets.Socket]$Socket = $null

# Checking host address and port.
if ($TelnetHost -match ":")
{
    $hostBytes = $TelnetHost.Split(':')
    $TelnetHost = $hostBytes[0]
    $Port = $hostBytes[1]
}
    
if ([String]::IsNullOrEmpty($TelnetHost))
{
    Write-Host -Object "Error: Invalid host address (null or empty)." -ForegroundColor Red
    return
}

# Setup and connect the TCP Socket.
$Socket = New-Object -TypeName System.Net.Sockets.Socket(
    [System.Net.Sockets.AddressFamily]::InterNetwork,
    [System.Net.Sockets.SocketType]::Stream,
    [System.Net.Sockets.ProtocolType]::Tcp)
$Socket.NoDelay = $true
try
{
    $Socket.Connect($TelnetHost, $Port)
}
catch
{
    "Unable to connect to host {0}:{1}" -f $TelnetHost,$Port
    return
}

# This state object is used to pass the connected Socket and the
# PowerShell parent Host reference to the child PowerShell object.
$State = [PSCustomObject]@{"Socket"=$Socket;"Host"=$Host;"Exception"=$null}

# This script block is used as the receive code for the Socket
# from within the child PowerShell object.
$Script = {
    param($state)
    # This encoding object is used to decode the return string.
    [System.Text.ASCIIEncoding]$ASCIIEncoding = [System.Text.Encoding]::ASCII

    # TELNET commands
    [Byte]$GA = 249 # Go Ahead
    [Byte]$WILL = 251 # Desire to begin
    [Byte]$WONT = 252 # Refusal to perform
    [Byte]$DO = 253 # Request that the other party perform
    [Byte]$DONT = 254 # Demand that the other party stop performing
    [Byte]$IAC = 255 # Interpret as Command

    # TELNET options
    [Byte]$ECHO = 1 # Used to check the echo mode
    [Byte]$SUPP = 3 # Suppress go ahead
        
    # Used to hold the number of bytes returned from the network stream.
    [Int]$bytes = 0
        
    # Buffer to hold the returned Bytes.
    [Byte[]]$buffer = New-Object -TypeName Byte[]($state.Socket.ReceiveBufferSize)
    
    # This is the main receive loop.
    while ($state.Socket.Connected)
    {
        try
        {
            # The following statement will block the thread until data is received.
            $bytes = $state.Socket.Receive($buffer)
        }
        catch
        {
            # This exception reference is used to pass the error back to the
            # parent PowerShell process.
            $state.Exception = $Error[0]
            break
        }

        if ($bytes -gt 0)
        {
            $index = 0
            $responseLen = 0
            
            # The index is used to move through the buffer to analyze the received data
            # looking for Telnet commands and options.
            while ($index -lt $bytes)
            {
                if ($buffer[$index] -eq $IAC)
                {
                    try
                    {
                        switch ($buffer[$index + 1])
                        {
                            # If two IACs are together they represent one data byte 255
                            $IAC
                            {
                                $buffer[$responseLen++] = $buffer[$index]
                                $index += 2
                                break
                            }
                            
                            # Ignore the Go-Ahead command
                            $GA
                            {
                                $index += 2
                                break
                            }
                            
                            # Respond WONT to all DOs and DONTs
                            {($_ -eq $DO) -or ($_ -eq $DONT)}
                            {
                                $buffer[$index + 1] = $WONT
                                $state.Socket.Send($buffer, $index, 3,
                                    [System.Net.Sockets.SocketFlags]::None) | Out-Null
                                $index += 3
                                break
                            }
                            
                            # Respond DONT to all WONTs
                            $WONT
                            {
                                $buffer[$index + 1] = $DONT
                                $state.Socket.Send($buffer, $index, 3,
                                    [System.Net.Sockets.SocketFlags]::None) | Out-Null
                                $index += 3
                                break
                            }
                            
                            # Respond DO to WILL ECHO and WILL SUPPRESS GO-AHEAD
                            # Respond DONT to all other WILLs
                            $WILL
                            {
                                [Byte]$action = $DONT

                                if ($buffer[$index + 2] -eq $ECHO)
                                {
                                    $action = $DO
                                }
                                elseif ($buffer[$index + 2] -eq $SUPP)
                                {
                                    $action = $DO
                                }

                                $buffer[$index + 1] = $action
                                $state.Socket.Send($buffer, $index, 3,
                                    [System.Net.Sockets.SocketFlags]::None) | Out-Null
                                $index += 3;
                                break;
                            }
                        }
                    }
                    catch
                    {
                        # If there aren't enough bytes to form a command, terminate the loop.
                        $index = $bytes
                    }
                }
                else
                {
                    if ($buffer[$index] -ne 0)
                    {
                        $buffer[$responseLen++] = $buffer[$index]
                    }
                    $index++
                }
            }
            
            # Displays the response with no command codes on the parent PowerShell object.
            $returnString = $ASCIIEncoding.GetString($buffer, 0, $responseLen)
            $state.Host.UI.Write($returnString)
        }
    }
} # End of the child PowerShell script definition.

# Create a child PowerShell object to run the background Socket receive method.
$PS = [PowerShell]::Create()
$PS.AddScript($Script).AddArgument($State) | Out-Null
[System.IAsyncResult]$AsyncJobResult = $null
try
{
    # The receive job is started asynchronously.
    $AsyncJobResult = $PS.BeginInvoke()
    
    while ($Socket.Connected)
    {
        # Wait for keys to be pressed in the parent PowerShell console window.
        # This is a blocking call so the telnet session may get disconnected
        # while waiting for a key to be pressed.
        $Key = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyUp").Character
                
        # Check the socket and see if it is still active.
        $PollCheck1 = $Socket.Poll(5000,[System.Net.Sockets.SelectMode]::SelectRead)
        $PollCheck2 = ($Socket.Available -eq 0)
        if (($PollCheck1 -and $PollCheck2) -or ($State.Exception -ne $null)) { break }

        # Socket seems good, send the data.
        $Data = $ASCIIEncoding.GetBytes($key)
        $Socket.Send($Data) | Out-Null
    }
}
finally
{
    # Cleanup the socket and child PowerShell process.
    if ($Socket -ne $null)
    {
        $Socket.Close()
        $Socket.Dispose()
        $Socket = $null
    }

    if ($PS -ne $null -and $AsyncJobResult -ne $null)
    {
        $PS.EndInvoke($AsyncJobResult)
        $PS.Dispose()
    }
}
