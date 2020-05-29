# Kubernetes Hands-on Lab

Following are the steps to create a lab virtual machine to complete the Kubernetes lab:

## Create a Debian Virtual Machine

1. Login to the Azure Portal.
1. Go to Virtual Machines.
1. Create a new virtual machine with these settings:
   * Name: `vm-docker`
   * Region: `East US`
   * OS: `Debian Buster`
   * Username / Password (Use SSH for better security).
1. Wait for the machine to be created.
1. Go to the `vm-docker` virtual machine page.
1. Record the public IP address.
1. Under "Settings" click "Networking".
1. Add the following inbound security group rules:
   * Src Any SrcPort Any Dest Any DestPort 80
   * Src Any SrcPort Any Dest Any DestPort 8080

## Install Docker

Follow the instructions from the [Docker Website](https://docs.docker.com/engine/install/debian/).

Here are the commands from the above site:

```bash
sudo apt-get update

sudo apt-get install \
  apt-transport-https \
  ca-certificates \
  curl \
  gnupg-agent \
  software-properties-common

curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"

sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io
```

For bonus points, follow the [Post-installation steps for Linux](https://docs.docker.com/engine/install/linux-postinstall/). If you don't follow these steps you will have to use the `sudo` command when running any docker commands.

## Install docker-compose

Follow the instructions to install the [docker-compose](https://docs.docker.com/compose/install/) script.

Here is the automated installation command:

```bash
sudo curl -L "https://github.com/docker/compose/releases/download/1.25.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
```

## Install the Azure CLI with apt

Follow the instructions to from [Install Azure CLI with apt](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-apt?view=azure-cli-latest).

Here is the automated install command:
```bash
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
```

## Azure Kubernetes Tutorial

You now have a virtual machine you can use to go through the tutorial on [Microsoft's documentation page](https://docs.microsoft.com/en-us/azure/aks/).

There are seven steps:

1. [Prepare an application for Azure Kubernetes Service (AKS)](https://docs.microsoft.com/en-us/azure/aks/tutorial-kubernetes-prepare-app)
1. [Deploy and use Azure Container Registry](https://docs.microsoft.com/en-us/azure/aks/tutorial-kubernetes-prepare-acr)
1. [Deploy an Azure Kubernetes Service (AKS) cluster](https://docs.microsoft.com/en-us/azure/aks/tutorial-kubernetes-deploy-cluster)
1. [Run applications in Azure Kubernetes Service (AKS)](https://docs.microsoft.com/en-us/azure/aks/tutorial-kubernetes-deploy-application)
1. [Scale applications in Azure Kubernetes Service (AKS)](https://docs.microsoft.com/en-us/azure/aks/tutorial-kubernetes-scale)
1. [Update an application in Azure Kubernetes Service (AKS)](https://docs.microsoft.com/en-us/azure/aks/tutorial-kubernetes-app-update)
1. [Upgrade Kubernetes in Azure Kubernetes Service (AKS)](https://docs.microsoft.com/en-us/azure/aks/tutorial-kubernetes-upgrade-cluster)

