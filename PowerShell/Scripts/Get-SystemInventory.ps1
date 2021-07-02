
<#
    .SYNOPSIS
    Gets information about the local machine using CIM.

    .DESCRIPTION
    Returns a PSCustomObject containing information about he local machine.
    The information is broken down into major system information and
    subsystems in the following format;
    
    Computer
        > CPU
        > RAM
        > NIC
        > Drive
        > Display
        > DisplayAdapter

#>
[cmdletbinding()]
PARAM()

function Get-CPUArchitecture ($id) {
    switch ($id) {
        0 { return "x86" }
        1 { return "MIPS" }
        2 { return "Alpha" }
        3 { return "PowerPC" }
        6 { return "Itanium" }
        9 { return "x64" }
        default { return "Unknown" }
    }
}

$CS = Get-CimInstance -Class Win32_ComputerSystem
$BIOS = Get-CimInstance -Class Win32_BIOS
$OS = Get-CimInstance -Class Win32_OperatingSystem
$CPU = Get-CimInstance -Class Win32_Processor
$RAM = Get-CimInstance -Class Win32_PhysicalMemory
$NIC = Get-CimInstance -Class Win32_NetworkAdapter | Where-Object PhysicalAdapter -eq $true
$Drive = Get-CimInstance -Class Win32_DiskDrive
$Display = Get-CimInstance -Class Win32_DesktopMonitor
$DisplayAdapter = Get-CimInstance -Class Win32_VideoController

$Computer = [PSCustomObject][ordered]@{
    Date                      = (Get-Date).Date;
    Model                     = $CS.Model;
    Manufacturer              = $CS.Manufacturer;
    SerialNumber              = $BIOS.SerialNumber;
    SystemType                = $CS.SystemType;
    NumberOfProcessors        = $CS.NumberOfProcessors;
    NumberOfLogicalProcessors = $CS.NumberOfLogicalProcessors;
    NumberOfDrives            = ($Drive | Measure-Object).Count;
    TotalDriveSpace           = ($Drive | Measure-Object -Property Size -Sum).Sum;
    NumberOfNetworkInterfaces = ($NIC | Measure-Object).Count;
    NumberOfMemoryCards       = ($RAM | Measure-Object).Count;
    TotalPhysicalMemory       = $CS.TotalPhysicalMemory;
    BIOSName                  = $BIOS.Caption;
    BIOSDescription           = $BIOS.Description;
    BIOSVersion               = $BIOS.SMBIOSBIOSVersion;
    BIOSMajorVersion          = $BIOS.SMBIOSMajorVersion;
    BIOSMinorVersion          = $BIOS.SMBIOSMinorVersion;
    OSName                    = $OS.Caption;
    OSVersion                 = $OS.Version;
    OSServicePackMajorVersion = $OS.ServicePackMajorVersion;
    OSServicePackMinorVersion = $OS.ServicePackMinorVersion;
    OSTotalVisibleMemorySize  = $OS.TotalVisibleMemorySize;
    OSFreePhysicalMemory      = $OS.FreePhysicalMemory;

    CPU                       = (New-Object -TypeName System.Collections.ObjectModel.Collection[PSObject]);
    RAM                       = (New-Object -TypeName System.Collections.ObjectModel.Collection[PSObject]);
    NIC                       = (New-Object -TypeName System.Collections.ObjectModel.Collection[PSObject]);
    Drive                     = (New-Object -TypeName System.Collections.ObjectModel.Collection[PSObject]);
    Display                   = (New-Object -TypeName System.Collections.ObjectModel.Collection[PSObject]);
    DisplayAdapter            = (New-Object -TypeName System.Collections.ObjectModel.Collection[PSObject]);
}

foreach ($proc in $CPU) {
    $Computer.CPU.Add([PSCustomObject][ordered]@{
            Name                      = $proc.Name;
            Caption                   = $proc.Caption;
            Description               = $proc.Description;
            Manufacturer              = $proc.Manufacturer;
            Architecture              = (Get-CPUArchitecture ($proc.Architecture));
            ClockSpeed                = $proc.CurrentClockSpeed;
            MaxClockSpeed             = $proc.MaxClockSpeed;
            ExternalClockSpeed        = $proc.ExtClock;
            AddressWidth              = $proc.AddressWidth;
            DataWidth                 = $proc.DataWidth;
            L2CacheSize               = $proc.L2CacheSize;
            L3CacheSize               = $proc.L3CacheSize;
            NumberOfCores             = $proc.NumberOfCores;
            NumberOfLogicalProcessors = $proc.NumberOfLogicalProcessors;
            DeviceID                  = $proc.DeviceID;
            Family                    = $proc.Family;
            Version                   = $proc.Version;
        })
}

foreach ($mem in $RAM) {
    $Computer.RAM.Add([PSCustomObject][ordered]@{
            Capacity      = $mem.Capacity;
            Speed         = $mem.Speed;
            DataWidth     = $mem.DataWidth;
            DeviceLocator = $mem.DeviceLocator;
        })
}

foreach ($net in $NIC) {
    $config = $net | Get-CimAssociatedInstance -ResultClassName "Win32_NetworkAdapterConfiguration"
    $Computer.NIC.Add([PSCustomObject][ordered]@{
            Name             = $net.Name;
            Description      = $net.Description;
            Manufacturer     = $net.Manufacturer;
            AdapterType      = $net.AdapterType;
            Speed            = $net.Speed;
            ServiceName      = $net.ServiceName;
            DNSDomain        = $config.DNSDomain;
            DNSHostName      = $config.DNSHostName;
            DNSServer        = [String]($config.DNSServerSearchOrder);
            IPAddress        = [String]($config.IPAddress);
            IPSubnet         = [String]($config.IPSubnet);
            IPDefaultGateway = $config.DefaultIPGateway;
            DHCPServer       = $config.DHCPServer;
            MACAddress       = $net.MACAddress;
        })
}

foreach ($drv in $Drive) {
    $Computer.Drive.Add([PSCustomObject][ordered]@{
            Name          = $drv.Caption;
            InterfaceType = $drv.InterfaceType;
            Size          = $drv.Size;
            MediaType     = $drv.MediaType;
            SerialNumber  = $drv.SerialNumber;
        })
}

foreach ($dsp in $Display) {
    $Computer.Display.Add([PSCustomObject][ordered]@{
            Description           = $dsp.Description;
            Manufacturer          = $dsp.MonitorManufacturer;
            Name                  = $dsp.Name;
            PixelsPerXLogicalInch = $dsp.PixelsPerXLogicalInch;
            PixelsPerYLogicalInch = $dsp.PixelsPerYLogicalInch;
            ScreenHeight          = $dsp.ScreenHeight;
            ScreenWidth           = $dsp.ScreenWidth;
            Type                  = $dsp.MonitorType;
        })
}

foreach ($dsp in $DisplayAdapter) {
    $Computer.DisplayAdapter.Add([PSCustomObject][ordered]@{
            Description                 = $dsp.Description;
            CurrentBitsPerPixel         = $dsp.CurrentBitsPerPixel;
            CurrentHorizontalResolution = $dsp.CurrentHorizontalResolution;
            CurrentVerticalResolution   = $dsp.CurrentVerticalResolution;
            DriverVersion               = $dsp.DriverVersion;
            Name                        = $dsp.Name;
            VideoModeDescription        = $dsp.VideoModeDescription;
            VideoProcessor              = $dsp.VideoProcessor;
        })
}

Write-output -InputObject $Computer
    
    
    
 