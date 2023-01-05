#!/bin/bash

echo "Criando as imagens......"

docker build -t costabeto/k8s-lb-api-backend backend/.

docker build -t costabeto/k8s-lb-api-database database/.

echo "Realizando push das imagens...."

docker push costabeto/k8s-lb-api-backend

docker push costabeto/k8s-lb-api-database

echo "Criando serviços no cluster kubernetes......"

kubectl apply -f ./services.yml

echo "Criando os deployments no cluster kubernetes......"

kubectl apply -f ./deployment.yml
