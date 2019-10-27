#!/usr/bin/env bash

set -e

RESTORE='\033[0m'
BLUE='\033[01;34m'
GREEN='\033[01;32m'

function eval_minikube() {
    echo -e "${BLUE}=> Setting environment minikube......${RESTORE}"
    eval "$(minikube docker-env)"
    echo -e ""
}

function build_docker() {
    echo -e "${BLUE}=> Building Docker Image......${RESTORE}"
    docker build --target prod -t thiagolsfortunato/node-web-app . --no-cache
    echo -e ""
}

function stop_resources() {
    echo -e "${BLUE}=> Deleting namespace, deployment, service and ingress......${RESTORE}"
    kubectl --namespace=test-kube-pet delete deployment test-kube-pet || true
    kubectl --namespace=test-kube-pet delete services test-kube-pet-service || true
    kubectl --namespace=test-kube-pet delete ingress test-kube-pet-ingress || true
    kubectl delete namespace test-kube-pet || true
    echo -e ""
}

function run_kubectl() {
    pushd k8s || exit
    echo -e "${BLUE}=> Creating namespace, deployment, service and ingress......${RESTORE}"
    kubectl apply -f namespace.yaml
    kubectl apply -f deployments.yaml
    kubectl apply -f service.yaml
    kubectl apply -f ingress.yaml
    popd || exit
    echo -e ""
}

function get_minikube_ip() {
    echo -e "${BLUE}=> Waiting pods to be running......${RESTORE}"
    sleep 10
    echo -e ""
    echo -e "${GREEN}=> Application it's running on http://$(minikube ip) !!${RESTORE}"
}

function main() {
    eval_minikube
    build_docker
    stop_resources
    run_kubectl
    get_minikube_ip
}

main
    