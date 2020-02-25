# Google Kubernetes Engine

## Example

Log into GCP and launch the Cloud Shell.

```bash
# Create a deployment and launch a single instance nginx container
kubectl create deployment nginx --image=nginx:1.10.0

# View running containers
kubectl get pods

# Create an external load balancer with a public IP address
kubectl expose deployment nginx --port 80 --type LoadBalancer

# List the cluster services including the public IP address
kubectl get services

# Check the service is available on the internet
curl http://<External IP>

```
