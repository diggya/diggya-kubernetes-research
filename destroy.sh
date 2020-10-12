#!/bin/sh

kubectl config delete-cluster kubernetes \
  | tee -a destroy.log

sudo kubeadm reset --force \
  | tee -a destroy.log

sudo iptables -t nat -F
sudo iptables -t mangle -F
sudo iptables -F
sudo iptables -X
