# Kubernetes Resources

## Learning Resources

* [How Kubernetes Works](https://blog.sensu.io/how-kubernetes-works) - A 10 minute technology overview.
* [Kubernetes Academy](https://kubernetes.academy/) - Bite-size video lessons developed by expert instructors.
* [kubernetes-workshop](https://github.com/eon01/kubernetes-workshop) - A Gentle introduction to Kubernetes with more than just the basics.
* [Domesticating Kubernetes](https://blog.quickbird.uk/domesticating-kubernetes-d49c178ebc41) - Kubernetes as home server on bare metal in 150 minutes.
* [Kubernetes The Hard Way](https://github.com/kelseyhightower/kubernetes-the-hard-way) - Bootstrap Kubernetes the hard way on Google Cloud Platform.

## Projects and Services

* [k3s](https://k3s.io/)
* [kubeadm](https://github.com/cablespaghetti/kubeadm-aws)
* [KubeSail](https://kubesail.com/) - Get a free Kubernetes Cluster, instantly.
* [cri-o](https://cri-o.io/) - Lightweight Container Runtime for Kubernetes.
* [Operators](https://operatorhub.io/what-is-an-operator) - The goal of an Operator is to put operational knowledge into software.
* [Portainer](https://github.com/portainer/portainer) - Making Docker management easy.
* [Envoy Proxy](https://github.com/envoyproxy/envoy) - Edge and service proxy, designed for cloud-native applications.
* [Knative](https://github.com/knative) - Kubernetes-based platform to deploy and manage modern serverless workloads.
* [Istio](https://github.com/istio/istio) - Connect, secure, control, and observe services.
* [kubespray](https://github.com/kubernetes-sigs/kubespray) - Deploy a Production Ready Kubernetes Cluster.


See [Serverless on Kubernetes](https://github.com/DDLSTraining/Engage/blob/master/Cloud/Serverless.md#serverless-on-kubernetes) from the Serverless document.

### Resources

* [Awesome Kubernetes (GitHub)](https://github.com/ramitsurana/awesome-kubernetes)

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

## Kubernetes Architecture

* ConfigMap:
  * YAML File.
  * An API object that stores data as key-value pairs.
  * Store non-confidential configuration data.
  * Use for environment variables, command line arguments, or configuration files.

* Secret:
  * YAML File.
  * Stores sensitive information in key-value pairs.
  * Protects and encrypts credential data.

* Pod:
  * Pods are the basic building blocks within Kubernetes.
  * A pod is a group of one or more containers.
  * Defined in a PodSpec file which is a specification for how to run the containers.

* Namespace:
  * Allow you to create virtual clusters backed by the same physical cluster.
  * They prevent resource name conflicts.

* Deployment:
  * A ReplicaSet ensures that a specific number of pod replicas are running at any given time.
  * Deployments own and manages ReplicaSets.

* Pod Scheduling:
  * Checks the resources required by your pods and uses that information to influence scheduling decisions.
  * Runs a series of filters to exclude ineligible nodes for pod placement.
  * Filters include CPU, memory, disk, ports, and volumes.
  * After applying filters, the scheduler calculates a score for each node that has not been filtered out.
  * Pods get placed on the highest-scoring node.
  * You can set up scheduling constraints at the node and pod level.

* ResourceQuota:
  * Support the request and limit settings.
  * Request allows you to specify how many resources are assigned.
  * Limits define what a running container can burst up to.
  * CPU is measured in millicpu (1000 = 1 vCPU).
  * Memory is measured in bytes.

* Taints and Tolerations:
  * Taints are a property of nodes that prevent the placement of pods.
  * A tainted node accepts only pods that specifically tolerate the taint.

* nodeAffinity:
  * Ensures that only pods with a correct toleration can be scheduled to a node.
  * There are two types: requiredDuringSchedulingIgnoredDuringExecution (hard), preferredDuringSchedulingIgnoredDuringExecution (soft).
  * The "IgnoredDuringExecution" component means that changes to affinity rules druing runtime will not affect running pods.
  * Anti-affinity can be used to make sure that your pods don't end up on the same node.

* DaemonSet:
  * Ensures that all nodes have a copy of the requested pod.
  * Useful for common functionality such as logging, monitoring, backups, etc.
  * If you delete a DaemonSet, you also delete any pods it created.




