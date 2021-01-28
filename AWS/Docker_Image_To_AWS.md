# Create Docker Container Locally then migrate to AWS 
## Docker - Create your first Container
### Steps for Deploying a Static HTML Site with Docker and Nginx
The goal of this exercise is to create a Docker image which will run a HTML website.

I have already installed [Docker Desktop for Windows](https://hub.docker.com/editions/community/docker-ce-desktop-windows) on my laptop 😊 

I have also created a very simple **HTML website** and installed **AWS CLI** locally.

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

# Running the Container on AWS 

## Creating a Repository
Before you can push your Docker images to Amazon ECR, you must create a repository to store them in. 
You can create Amazon ECR repositories with the AWS Management Console, or with the AWS CLI and AWS SDKs.
## To create a repository
1.	Open the Amazon ECR console at **https://console.aws.amazon.com/ecr/repositories**.
2.	From the navigation bar, choose the Region to create your repository in.
3.	In the navigation pane, choose Repositories.
4.	On the Repositories page, choose Create repository.
5.	For Repository name, enter a unique name for your repository.
6.	For Tag immutability, choose the tag mutability setting for the repository. 
	Repositories configured with immutable tags will prevent image tags from being overwritten. For more information, see Image tag mutability.
7.	For Scan on push, choose the image scanning setting for the repository. 
	Repositories configured to scan on push will start an image scan whenever an image is pushed, otherwise image scans need to be started manually. For more information, 		see Image scanning.
8.	For KMS encryption, choose whether to enable encryption of the images in the repository using AWS Key Management Service. 
	By default, when KMS encryption is enabled Amazon ECR uses an AWS managed customer master key (CMK) with alias aws/ecr, which is created in your account the first time 	that you create a repository with KMS encryption enabled. For more information, see Encryption at rest.
9.	When KMS encryption is enabled, select Customer encryption settings (advanced) to choose your own CMK. The CMK must exist in the same Region as the cluster. 
	Choose Create an AWS KMS key to navigate to the AWS KMS console to create your own key.
10.	Choose Create repository.

## Use the following steps to authenticate and push an image to your repository. 

## Retrieve an authentication token and authenticate your Docker client to your registry.

Use the AWS CLI:

## aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 741004157452.dkr.ecr.us-east-1.amazonaws.com

**Note:** for this example, my Repository is in us-east-1 and its URI is 741004157452.dkr.ecr.us-east-1.amazonaws.com yours will be different

**Note:** If you receive an error using the AWS CLI, make sure that you have the latest version of the AWS CLI and Docker installed.

As I already have an image built on my PC, I now only need to Tag it before Pushing it to the Repository on AWS.

To tag your image so you can push the image to this repository:
## docker tag html-image:v1 741004157452.dkr.ecr.us-east-1.amazonaws.com/adriancontainers

**Note:** for this example, my image is called html-image:v1 and the repository URI is 741004157452.dkr.ecr.us-east-1.amazonaws.com/adriancontainers again yours will be different
Run the following command to push this image to your newly created AWS repository:
docker push 741004157452.dkr.ecr.us-east-1.amazonaws.com/adriancontainers
Note: Yet again your repository URI will be different.
AWS Concepts
So, we’ve got a Docker image ready to be deployed to AWS. Before we start working with AWS, let’s learn some high-level AWS vocabulary that we’ll need.
ECS - Elastic Container Service
ECS is the “entry point” service that allows us to run Docker containers on AWS infrastructure. Under the hood, it uses a bunch of other AWS services to get things done.
Task
A task is AWS domain language for a wrapper around one or more Docker containers. A task instance is what AWS considers an instance of our application.
Service
A service wraps a task and provides security rules to control access and potentially load balancing rules to balance traffic across multiple task instances.
Cluster
A cluster provides a network and scaling rules for the tasks of a service.
Deploying a Docker Image Using the Management Console
We’ll configure a task, service, and cluster using the “Get Started” wizard provided in the web-based management console. This wizard is very convenient to use, but it’s very limited in its feature set. We don’t have all the configuration options available.
Also, by definition, deploying containers via the web-based wizard is a manual process and cannot be automated. In real-world scenarios, we want to automate deployments and will need to use the AWS CLI.

Configuring the Container
First, we configure the Docker container:
 
We can select a pre-defined Docker image or choose our own. We want to use the Docker image we published previously, so we’ll click on the “Configure” button in the “custom” box to open the “Edit container” form and will be prompted to enter a bunch of information:
Container name: An arbitrary name for the container.
Image: The URL to the Docker image in AWS ECR If you have published your image in a Docker registry different from Docker Hub, check with that registry what the URL to your image looks like. For me it’s:
 741004157452.dkr.ecr.us-east-1.amazonaws.com/adriancontainers:latest
Memory Limits: We’ll leave the default (i.e. no memory limits). This should definitely be thought out and set in a production deployment, though!
Port mappings: Here we can define the container port, i.e. the port that our application exposes. Here I have started with port 80:

Configuring the Task
Next, we configure the task, which wraps our Docker image:
 
We leave everything in the default setting except the name, so we can find the task later.
Configuring the Service
Next, the wizard takes us to a screen configuring the service that’s going to wraps the task we just configured:
 
Again, we just change the name and leave everything in the default setting.
Configuring the Cluster
We do the same with the cluster configuration:
 
Change the name, leave the rest on default, hit “Next”.
Testing the Service
After checking everything again and hitting the “Create” button, we’ll be redirected to a screen showing the steps AWS performs to set everything up:
 
When all steps are completed, hit the “View service” button, and we’ll a screen like this:
 
This screen shows a whole bunch of information about the status of the service we have just started. 
But where do we find the URL it’s available at so that I can test it out?
To find the URL of our application in the web console, do the following:
	Click on the cluster name to see the status of the cluster.
	In the “Tasks” tab, click the name of the task to see the status of the task.
	Click the “ENI Id” of the task to see the status of the network interface of that task (ENI = Elastic Network Interface).
	On the status page of the network interface, we finally find the public IPv4 address we can use to access our freshly deployed service.
Just enter the public IPv4 address in in your browser, and you should see the web site.
