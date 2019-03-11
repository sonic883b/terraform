#!/bin/bash

set -xe

cd ~/bin

TF_VERSION=0.9.9

if [ ! -e ~/bin/terraform ]; then
  wget https://releases.hashicorp.com/terraform/${TF_VERSION}/terraform_${TF_VERSION}_linux_amd64.zip
  unzip terraform_${TF_VERSION}_linux_amd64.zip
  rm terraform_${TF_VERSION}_linux_amd64.zip
fi
