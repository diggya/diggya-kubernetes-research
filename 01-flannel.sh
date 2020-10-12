#!/bin/sh

# https://kubernetes.io/docs/concepts/cluster-administration/networking/#how-to-implement-the-kubernetes-networking-model
# https://github.com/coreos/flannel

# Install `flannel` as network interface
kubectl apply -f \
  https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml \
  | tee -a create.log

