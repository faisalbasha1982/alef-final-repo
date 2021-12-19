#!/bin/bash

#README INSTRUCTION

#ON A KUBERNETES READY CLUSTER with 
   #1) nginx-ingress
   #2) helm 

#1) Create Namespace
kubectl create ns alef-backend

#2) build docker image of the angular/node js script
sudo git clone https://github.com/faisalbasha1982/alef-final-repo.git
cd alef-final-repo
sudo docker build -t faisalbasha82/alef-app:app-1.0

sudo git clone https://github.com/faisalbasha1982/mongodb-standalone-alef.git
cd mongodb-standalone-alef
kubectl apply -f deployment.yaml
kubectl apply -f secrets.yaml
kubectl apply -f service.yaml

sudo git clone https://github.com/faisalbasha1982/alef-final-helm-charts.git
helm install alef-mean-app alef-final-helm-charts -n alef-backend   
         
