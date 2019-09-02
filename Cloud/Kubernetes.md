# Kubernetes Resources

## Learning Resources

* [How Kubernetes Works](https://blog.sensu.io/how-kubernetes-works) - A 10 minute technology overview.
* [Kubernetes Academy](https://kubernetes.academy/) - Bite-size video lessons developed by expert instructors.

## Projects and Services

* [k3s](https://k3s.io/)
* [kubeadm](https://github.com/cablespaghetti/kubeadm-aws)
* [KubeSail](https://kubesail.com/) - Get a free Kubernetes Cluster, instantly.
* [cri-o](https://cri-o.io/) - Lightweight Container Runtime for Kubernetes.

See [Serverless on Kubernetes](https://github.com/DDLSTraining/Engage/blob/master/Cloud/Serverless.md#serverless-on-kubernetes) from the Serverless document.

## Learn Kubernetes Cluster Management with Minikube

The [Kubernetes](https://github.com/kubernetes) organization on GitHub manages a learning tool called [Minikube](https://github.com/kubernetes/minikube).

> Minikube is a tool that makes it easy to run Kubernetes locally. Minikube runs a single-node Kubernetes cluster inside a VM on your laptop for users looking to try out Kubernetes or develop with it day-to-day.

There are two ways to follow the [Kubernetes Basics](https://kubernetes.io/docs/tutorials/kubernetes-basics/) tutorial:

1. Play with Kubernetes in the browser.
1. [Install Minikube](https://github.com/kubernetes/minikube#installation) to test it out on your laptop. To run the tutorial on your own device you will also need to install the [kubectl command](https://kubernetes.io/docs/tasks/tools/install-kubectl/).

### Tutorial Issues (Minikube install only)

#### Windows Desktop Issues

##### Hyper-V or VirtualBox

As you will see on the tutorial pages, you will need either Hyper-V installed or VirtualBox.

If you are using Hyper-V the start command is `minikube start --vm-driver=hyperv`.

You will get an error message `VBoxManage not found` if you are using Hyper-V and don't state the `vm-driver` parameter.

##### User Profile Drive

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
