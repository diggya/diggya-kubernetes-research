#!/bin/sh

if [ -f create.log ] ; then rm create.log ; fi

KUSER=$USER

# Node name
NODE=`hostname`

# An external address of a node.
# This adress should be routable between all nodes
if [ -z "$1" ] ; then
ADVERTISE_ADDR=10.8.0.2
else
ADVERTISE_ADDR=$1
fi

# Network for pods. This network should not conflict with exising networks.
# Each node takes /24 network
POD_NETWORK=10.244.0.0/16

# To check connectivity
sudo kubeadm config images pull \
  | tee -a create.log

# Create contol plane of a cluster
sudo kubeadm init \
  --apiserver-advertise-address=$ADVERTISE_ADDR \
  --pod-network-cidr=$POD_NETWORK \
  | tee -a create.log

# Copy credentials to user homedir
mkdir -p $HOME/.kube
if [ -f $HOME/.kube/config ] ; then sudo rm -f $HOME/.kube/config ; fi
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u $KUSER):$(id -g $KUSER) $HOME/.kube/config

# https://kubernetes.io/docs/concepts/cluster-administration/networking/#how-to-implement-the-kubernetes-networking-model
# https://github.com/coreos/flannel

# Install `flannel` as network interface
kubectl apply -f \
  https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml \
  | tee -a create.log

# https://stackoverflow.com/questions/52902337/unable-to-update-node-annotation-in-kubernetes
# Allow to create services on control node
kubectl taint node $NODE node-role.kubernetes.io/master-

echo ==============================================================================================
kubectl get nodes
echo ==============================================================================================
kubectl describe node $NODE
