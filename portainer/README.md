# Deployment of the Protainer

[Instruction](https://www.portainer.io/installation/).

[Persistent Volume](https://kubernetes.io/docs/tasks/configure-pod-container/configure-persistent-volume-storage/).

[GlusterFS](https://www.howtoforge.com/tutorial/high-availability-storage-with-glusterfs-on-debian-8-with-two-nodes/).

[GlusterFS with Kubernetes](https://github.com/kubernetes/examples/tree/master/volumes/glusterfs).

## Changes

portainer will be configured to use GlusterFS storage

## Deploy

~~~~~~
kubectl create -f 00-portainer.yaml
kubectl create -f https://downloads.portainer.io/portainer-agent-k8s-nodeport.yaml
kubectl create -f https://github.com/kubernetes-sigs/metrics-server/releases/download/v0.3.7/components.yaml
~~~~~~
