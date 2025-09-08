#!/usr/bin/env bash
set -euo pipefail

kubectl apply -f 00-namespace.yaml

kubectl -n np-task5 run front-end-app --image=nginx --labels role=front-end --port=80 --expose
kubectl -n np-task5 run back-end-api-app --image=nginx --labels role=back-end-api --port=80 --expose
kubectl -n np-task5 run admin-front-end-app --image=nginx --labels role=admin-front-end --port=80 --expose
kubectl -n np-task5 run admin-back-end-api-app --image=nginx --labels role=admin-back-end-api --port=80 --expose