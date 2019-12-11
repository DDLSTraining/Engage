# Container Architecture Resources

* [Kata Containers](https://katacontainers.io/): The speed of containers, the security of VMs.
* [docker-slim](https://github.com/docker-slim/docker-slim) - Don't change anything in your Docker container image and minify it by up to 30x.

## Docker in DDLS

The current Windows Server OS does not support [Docker for Windows Desktop](https://docs.docker.com/docker-for-windows/). Use the [Docker Toolbox](https://docs.docker.com/toolbox/toolbox_install_windows/) instead.

Once Docker Toolbox is installed, follow these steps (all commands are in PowerShell):

1. Run the script `Install-HyperVRole` and restart.
1. Create a Hyper-V Virtual Switch connected to your NIC called `External`.
1. Download a docker VM using the following command ([Reference](https://docs.docker.com/v17.09/machine/drivers/hyper-v/)):
   * `docker-machine create -d hyperv --hyperv-virtual-switch "External" dockervm` 
1. Set the docker environment using:
   * `& docker-machine env dockervm --shell powershell | Invoke-Expression`

The environment variables will only be available in the current PowerShell process.

