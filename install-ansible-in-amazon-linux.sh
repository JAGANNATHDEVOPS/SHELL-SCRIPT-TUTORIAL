#!/bin/bash
sudo yum update -y
sudo dnf uninstall python3.11 -y
sudo dnf install python3-pip -y
pip install ansible
