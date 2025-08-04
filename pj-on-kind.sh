#!/bin/bash
set -euo pipefail

JOB_NAME=$1
kubectl create -f prowjob.yaml --dry-run=client -o yaml | \
  sed \"s/REPLACE_JOB_NAME/${JOB_NAME}/\" | \
  kubectl apply -f -
