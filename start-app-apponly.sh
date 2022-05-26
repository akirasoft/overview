#!/bin/bash

echo "=========================================================="
echo "Starting app on k8"
echo "=========================================================="

echo "----------------------------------------------------------"
echo "kubectl create ns dt-orders"
echo "----------------------------------------------------------"
kubectl create ns dt-orders

echo "----------------------------------------------------------"
echo "Labeling namespace to enable injection"
echo "----------------------------------------------------------"
kubectl label namespace dt-orders monitor=applicationMonitoring

echo "----------------------------------------------------------"
echo "kubectl -n dt-orders apply -f catalog-service.yaml"
echo "----------------------------------------------------------"
kubectl -n dt-orders apply -f catalog-service.yaml

echo "----------------------------------------------------------"
echo "kubectl -n dt-orders apply -f customer-service.yaml"
echo "----------------------------------------------------------"
kubectl -n dt-orders apply -f customer-service.yaml

echo "----------------------------------------------------------"
echo "kubectl -n dt-orders apply -f order-service.yaml"
echo "----------------------------------------------------------"
kubectl -n dt-orders apply -f order-service.yaml

echo "----------------------------------------------------------"
echo "kubectl -n dt-orders apply -f frontend.yaml"
echo "----------------------------------------------------------"
kubectl -n dt-orders apply -f frontend.yaml

echo "----------------------------------------------------------"
echo "kubectl -n dt-orders get pods"
echo "----------------------------------------------------------"
sleep 5
kubectl -n dt-orders get pods