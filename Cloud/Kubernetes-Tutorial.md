# Learn Kubernetes Cluster Management with Minikube

The [Kubernetes](https://github.com/kubernetes) organization on GitHub manages a learning tool called [Minikube](https://github.com/kubernetes/minikube).

> Minikube is a tool that makes it easy to run Kubernetes locally. Minikube runs a single-node Kubernetes cluster inside a VM on your laptop for users looking to try out Kubernetes or develop with it day-to-day.

Follow the [Kubernetes Basics](https://kubernetes.io/docs/tutorials/kubernetes-basics/) tutorial to play with Kubernetes in the browser, or [install Minikube](https://github.com/kubernetes/minikube#installation) to test it out on your desktop or laptop.

## Tutorial Issues (Minikube install only)

### Windows Desktop Issues

#### Hyper-V or VirtualBox

As you will see on the tutorial pages, you will need either Hyper-V installed or VirtualBox.

If you are using Hyper-V the start command is `minikube start --vm-driver=hyperv`.

You will get an error message `VBoxManage not found` if you are using Hyper-V and don't state the `vm-driver` parameter.

#### User Profile Drive

If you are using `D:\` drive to run the commands and your user profile is hosted in `C:\Users` you will get the following error message:

```

Error executing step: Creating VM.
: open /Users/UserName/.minikube/cache/iso/minikube-v0.28.1.iso: The system cannot find the path specified.

```

The fix for this is as follows:

1. Delete the `C:\Users\UserName\.minikube` directory.
1. Change the command prompt to `C:\` drive (present working directory).
1. Run the `minikube start` command again.

The [GitHub Issue](https://github.com/kubernetes/minikube/issues/459) for reference.
