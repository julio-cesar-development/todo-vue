#!/bin/bash

if [ $(which wget | wc -l) -eq 0 -o $(which unzip | wc -l) -eq 0 ]
then
  echo "You need to install wget and unzip to preceed"
  exit 1
fi

if [ -z $(which wget) ]
then
  VERSION="0.11.13"
  wget https://releases.hashicorp.com/terraform/${VERSION}/terraform_${VERSION}_linux_amd64.zip
  unzip "terraform_${VERSION}_linux_amd64.zip"
  rm "terraform_${VERSION}_linux_amd64.zip"
fi

terraform init
terraform apply -auto-approve

echo "Access the browser on http://localhost:80 to see the application running"
exit 0
