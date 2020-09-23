# How to deploy one-node kubernetes cluster with flannel CNI

Pre-requirements:

  1) docker
  2) *no* swap
  3) [kubeadm](https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/)

~~~~~~
./create.sh
~~~~~~

Then proceed to [example](https://kubernetes.io/docs/tutorials/stateless-application/guestbook/):

~~~~~~
cd redis
~~~~~~

# Create redis master deployment

This deployment contains 1 pod. Pod does some work.

~~~~~~
./01.sh
~~~~~~

# Create redis master service

Service list ports exposed by deployment.

~~~~~~
./02.sh
~~~~~~

# Create redis slave deployment

This deployment contains 2 pod. Pod does some work.

~~~~~~
./03.sh
~~~~~~

# Create redis slave service

Service list ports exposed by deployment.

~~~~~~
./04.sh
~~~~~~

# Create deployment frontend

This create deployment thant contains and three `frontend` pods.

~~~~~~
./05.sh
~~~~~~

# Create frontend service

Service list ports exposed by deployment.

~~~~~~
./06.sh
~~~~~~

# Delete everything

~~~~~~
./07.sh
~~~~~~