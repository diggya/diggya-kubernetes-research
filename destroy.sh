#!/bin/sh

kubectl config delete-cluster kubernetes \
  | tee -a destroy.log

sudo kubeadm reset --force \
  | tee -a destroy.log
