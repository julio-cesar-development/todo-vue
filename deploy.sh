#!/bin/bash

# (kubectl delete -f ./k8s 1> /dev/null 2>&1 && echo "Cleaning pods...") &
# wait

# namespace
# kubectl apply -f ./k8s/namespace.yaml

# change context
# CURRENT_CONTEXT=$(kubectl config view | grep "current-context" | cut -d ":" -f2 | tr -d ' ')
# kubectl config set-context "${CURRENT_CONTEXT}" --namespace=blackdevs
# kubectl config get-contexts

# secrets
kubectl apply -f ./k8s/secrets.yaml

# nginx ingress controller
kubectl apply -f ./k8s/nginx-ingress-controller.yaml

# deployment and service application
kubectl apply -f ./k8s/client-deployment.yaml
kubectl apply -f ./k8s/client-svc.yaml

# auto scaling pods
kubectl apply -f ./k8s/hpa.yaml

# ingress
kubectl apply -f ./k8s/ingress-service.yaml
