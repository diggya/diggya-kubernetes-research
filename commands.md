# List of useful commands

## Nodes management

Considered ADVERTISE_ADDR=10.8.0.2

Considered POD_NETWORK=10.244.0.0/16

~~~~~~
# creation of cluster and control plane
kubeadm init \
  --apiserver-advertise-address=10.8.0.2 \
  --pod-network-cidr=10.244.0.0/16

# remove taint "master" from all nodes
kubectl taint nodes --all node-role.kubernetes.io/master-

# Listing tokens to connect to a cluster
kubeadm token list

# Creating a token to connect
kubeadm token create

# Creating hash for a token
openssl x509 -pubkey -in /etc/kubernetes/pki/ca.crt | \
openssl rsa -pubin -outform der 2>/dev/null | \
openssl dgst -sha256 -hex | sed 's/^.* //'

# Joining to a cluster
kubeadm join --token <token> <control-plane-host>:6443 --discovery-token-ca-cert-hash <hash>

# Relocating pods and services from a node
kubectl drain <node-name> --delete-local-data --force --ignore-daemonsets

# Resetting state on remote node
kubeadm reset

# Removing node from a cluster
kubectl delete node <node-name>
~~~~~~

~~~~~~
kubectl get services
kubectl get deployments
kubectl get pods
kubectl describe pod <pod-name>
~~~~~~
