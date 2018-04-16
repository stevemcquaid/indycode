#!/bin/bash

# https://github.com/stevemcquaid/indycode

# Install kubectl
# https://kubernetes.io/docs/tasks/tools/install-kubectl/#before-you-begin

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

# Should show one container
kubectl get pods --watch 

kubectl get deployments

kubectl get deployment nginx -o yaml

# Should not show anything
kubectl get services

kubectl expose deployment nginx --port 80 --type LoadBalancer

# Should show one service
kubectl get services
# Should be same output
kubectl get svc

# curl http://<Service_IP>:80 # Cant do this

# Should show one pod
kubectl get pods

kubectl scale deployment nginx --replicas=2

# Should show two pods
kubectl get pods --watch

# Resources you created
kubectl get pods
kubectl get deployment
kubectl get svc

kubectl get deployment -o yaml > dep.yaml
kubectl get svc -o yaml > svc.yaml
