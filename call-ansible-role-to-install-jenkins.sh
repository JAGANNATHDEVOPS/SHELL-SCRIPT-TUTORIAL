#!/bin/bash
os_type=$(uname -s)
# Check if the operating system is Ubuntu
if [ "$os_type" = "Linux" ]; then
        echo "**********************************"
        echo "IT'S LINUX, BUT OS TYPE IS BELOW"
        if [ -e /etc/os-release ]; then
                . /etc/os-release
                if [ "$ID" = "ubuntu" ]; then
                        echo "======================="
                        echo "IT'S UBUNTU"
                        git clone https://github.com/JAGANNATHDEVOPS/JENKINS-TUTORIAL.git
                        sudo ansible-playbook ./JENKINS-TUTORIAL/jenkins-install.yml
                        echo "======================="
                        exit 0
                elif [ "$ID" = "amzn" ]; then
                        echo "======================="
                        echo "IT'S AMAZON LINUX"
                        echo "======================="
                        sudo yum install git -y
                        git clone https://github.com/JAGANNATHDEVOPS/JENKINS-TUTORIAL.git
                        ansible-playbook ./JENKINS-TUTORIAL/jenkins-install.yml
                        exit 0
                fi
        fi
fi
