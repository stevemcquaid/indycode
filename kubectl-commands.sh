#!/bin/bash

mkdir -p $HOME/.kube
sudo cp -i config $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

# To test:
kubectl get pods --kubeconfig $HOME/.kube/config
