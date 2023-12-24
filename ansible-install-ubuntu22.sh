#!/usr/bin/env bash
sudo apt-get update
sudo apt-get install software-properties-common ansible python-apt -y
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt-get update
sudo apt install -y ansible
