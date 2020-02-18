#!/bin/bash

# (kubectl delete -f ./k8s 1> /dev/null 2>&1 && echo "Cleaning pods...") &
# wait

# secrets
kubectl apply -f ./k8s/secrets.yaml

# nginx ingress controller
kubectl apply -f ./k8s/nginx-ingress-controller.yaml

# deployment and service application
kubectl apply -f ./k8s/client-deployment.yaml
kubectl apply -f ./k8s/client-cluster-ip-service.yaml

# ingress
kubectl apply -f ./k8s/ingress-service.yaml

# auto scaling pods
kubectl apply -f ./k8s/hpa.yaml
