#!/bin/bash

# namespace
kubectl apply -f ./k8s/namespace.yaml

# todoapp
kubectl apply -f ./k8s/todoapp-secrets.yaml
kubectl apply -f ./k8s/todoapp-deployment.yaml
kubectl apply -f ./k8s/todoapp-service.yaml
kubectl apply -f ./k8s/todoapp-hpa.yaml
kubectl apply -f ./k8s/todoapp-ingress.yaml
