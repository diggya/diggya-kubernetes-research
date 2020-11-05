#!/bin/sh

# Copy credentials to user homedir
mkdir -p $HOME/.kube
if [ -f $HOME/.kube/config ] ; then sudo rm -f $HOME/.kube/config ; fi
scp diggya.me:.kube/config $HOME/.kube/config

echo =================================================================
kubectl get nodes
