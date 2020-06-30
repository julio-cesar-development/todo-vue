#!/bin/bash

set -e

terraform fmt -write=true -recursive

terraform init -backend=true && \
  terraform validate && \
  terraform plan && \
  terraform apply -auto-approve
