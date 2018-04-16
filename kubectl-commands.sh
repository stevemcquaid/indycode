#!/bin/bash

# https://github.com/stevemcquaid/indycode

mkdir -p $HOME/.kube
sudo cp -i config $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

# To test:
kubectl get pods --kubeconfig $HOME/.kube/config

NAMESPACE="steve"
kubectl create namespace $NAMESPACE

kubectl config set-context $(kubectl config current-context) --namespace=$NAMESPACE

# Should not show anything
kubectl get pods

kubectl run nginx --image=nginx:1.10.0

kubectl get pods --watch # Should show one container