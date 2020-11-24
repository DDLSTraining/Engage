# Create Docker Container Locally then migrate to Azure 
## Docker - Create your first Container
### Steps for Deploying a Static HTML Site with Docker and Nginx
The goal of this exercise is to create a Docker image which will run a HTML website.

I have already installed [Docker Desktop for Windows](https://hub.docker.com/editions/community/docker-ce-desktop-windows) on my laptop 😊 

I have also created a very simple **HTML website** and installed **Azure Command Line** locally.

**Write a Dockerfile**

We want to create a Docker image with this web app and since the app is written in HTML, I’ll build an image based on **nginx** using a **Dockerfile**.

A **Dockerfile** is a text file that contains a list of commands that the Docker daemon calls while creating an image. The **Dockerfile** contains all the information that Docker needs to know to run the app:
      
      •	A base Docker image to run from
      
      •	The location of your project code
      
      •	Any dependencies it has
      
      •	And finally what commands to run at start-up

It is a simple way to automate the image creation process. The best part is that the commands you write in a **Dockerfile** are _almost_ identical to their equivalent Linux commands. This means you don't really have to learn new syntax to create your own Dockerfiles.
1.	Create a file called **Dockerfile** and add content to it as described below. 

**Change directory to where your app is sitting on your pc**. ( For me _“C:\Training Bits\Docker\html-server”)_

Then type **Notepad Dockerfile**

We'll start by specifying our base image, using the **FROM** keyword this will go and retrieve the image from the internet if you don’t already have a local copy.

   **FROM nginx:latest**
    
2.	The next step is usually to write the commands for copying the files and installing the dependencies. (Remember that different base images have different web engines and will require files to be placed in different locations.)

    **# copy files required for the app to run**

    **COPY IMG_3596.JPG /usr/share/nginx/html**

    **COPY IMG_3612.JPG /usr/share/nginx/html**

    **COPY IMG_3641.JPG /usr/share/nginx/html**

    **COPY IMG_3654.JPG /usr/share/nginx/html**

    **COPY index.html /usr/share/nginx/**

3.  Specify the port number which needs to be exposed, that is what the container will listen on:

    **EXPOSE 80**

4. Now save the **Dockerfile**  _(capital D and no extension)_
## Building the image
Now that you have your **Dockerfile**, we can build an image. 
The docker build command is quite simple - it takes an optional tag name with the **-t** flag, and the location of the directory containing the Dockerfile - the **“.”** indicates the current directory:
	**docker build -t html-image:v1 .**
Don’t forget the **“.”** it means current directory.  Also you can call it anything really 😊
After a short while you should receive something like this:
	**Successfully built 2f7357a0805d**

If you don't have the **nginx:latest** image, the client will first pull the image from the internet and then create your images**. If everything went well, your image should be ready! 

Now type **docker images** and see if your image **(html-image:v1)** is there.

## Running your image

The next step is to run the image and see if it actually works.

**docker run -d -p 80:80 --name html html-image:v1** 

There are a couple of common flags here:

**--p** or **--publish** asks Docker to forward traffic incoming on the host’s port 80 to the container’s port 80. Containers have their own private set of ports, so if you want to reach one from the network, you must forward traffic to it in this way. Otherwise, firewall rules will prevent all network traffic from reaching your container, as a default security posture.

**--d** or **--detach** asks Docker to run this container in the background.

**--name** specifies a name with which you can refer to your container in subsequent commands, in this case **html**.

Type **http://localhost** in your favorite browser and your app should be live. 

Once you’re satisfied that your Web App container works correctly, you can delete it:

**docker rm --force html**

The **--force option** stops a running container, so it can be removed. If you stop the container running with docker stop first, then you do not need to use **--force** to remove it.  Remember _**html**_ was my app container name.

## Running the Container on Azure 

### Sign-in to Azure

Sign into the Azure portal at (https://portal.azure.com).

### Create a container registry

Select **Create a resource > Containers > Container Registry.**

In the **Basics** tab, enter values for **Resource group** and **Registry name**. The registry name must be unique within Azure, and contain 5-50 alphanumeric characters.  
 
Accept default values for the remaining settings. Then select **Review + create**. After reviewing the settings, select **Create**.

A **Basic** registry, is a cost-optimized option for developers learning about Azure Container Registry.

When the **Deployment succeeded** message appears, select the container registry in the portal.
 
Take note of the **registry name** and the value of the **Login server**. You use these values in the following steps when you push and pull images with Docker.

## Log in to registry

Before pushing and pulling container images, you must log in to the registry instance. Sign into the Azure CLI on your local machine, then run the **az acr** login command. (Specify only the registry name when logging in with the Azure CLI. Don't include the 'azurecr.io' domain suffix.)

Azure CLI
	**az acr login --name _registry-name**_

Example:

Azure CLI
	**az acr login --name **_mycontainerregistry_**

The command returns **Login Succeeded** once completed.

## Push image to registry

Before you can push an image to your registry, you must tag it with the fully qualified name of your registry login server. 

The login server name is in the format: 

_**registry-name_.azurecr.io** (all lowercase), for example, _**mycontainerregistry.azurecr.io.**_

Tag the image using the **docker tag** command. Replace _**mycontainerregistry.azurecr.io**_ with the login server name of your ACR instance.

Example:

**docker tag html-image:v1 mycontainerregistry.azurecr.io/html-image:v1**

Finally, use **docker push** to push the image to the registry instance. 

Replace _**Login-server**_ with the login server name of your registry instance. 
T
his example creates the **web-html** repository, containing the **Web-html:v1 image.**
	
	**docker push _login-server_/html-image:v1**

After pushing the image to your container registry, remove the html-image:v1 image from your local Docker environment. (Note that this **docker rmi** command does not remove the image from the repository in your Azure container registry.)
	
**docker rmi _login-server_/html-image:v1**

## Enable admin account
You can deploy a container image from the registry directly to Web App but to enable this capability, you must also enable the registry's **admin account.**
Navigate to your new container registry in the Azure portal and select **Access keys** under **Settings**. Under **Admin user**, select **Enable**. 

## Deploy a Web App for Containers instance
In this step, you create a Web App for Containers instance in the West US region.
Sign in to the **Azure portal** and navigate to the registry you created in the previous tutorial.

Select **Repositories > html-image**, then right-click on the **v1** tag under **Tags** and select **Deploy to web app:**
 
If **"Deploy to web app"** is disabled, you might not have enabled the registry admin user.
U
nder **Web App for Containers** that's displayed after you select **"Deploy to web app,"** specify the following values for each setting:
**Site Name** - A globally unique name for the web app. In this example, we use the format **<acrName>-westus** to easily identify the registry and region the web app is deployed from.

**Resource Group**	 - Use existing > **myResourceGroup**
**App service plan/Location**	Create a new plan named **plan-westus** in the **West US** region.
**Image**	- **html-imaged:v1**
**Operating system**	- **Linux**


## Note:
When you create a new app service plan to deploy your containerized app, a default plan is automatically selected to host your application. The default plan depends on the operating system setting.
Select **Create** to provision the web app to the **West US** region.
 
## View the deployed web app
When deployment is complete, you can view the running application by navigating to its URL in your browser.
In the portal, select **App Services**, then the web app you provisioned in the previous step. In this example, the web app is named **_uniqueregistryname-westus_**.
Select the **hyperlinked URL** of the web app in the top-right of the **App Service** overview to view the running application in your browser.
 
Once the Docker image is deployed from your geo-replicated container registry, the site displays an image representing the Azure region hosting the container registry.
