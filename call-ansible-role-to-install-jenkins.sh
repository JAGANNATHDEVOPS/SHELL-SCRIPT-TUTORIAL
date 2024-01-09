#!/bin/bash
os_type=$(uname -s)
# Check if the operating system is Ubuntu
if [ "$os_type" == "Linux" ]; then
        echo "**********************************"
        echo "IT'S LINUX, BUT OS TYPE IS BELOW"
        if [ -e /etc/os-release ]; then
                source //etc/os-release
                if [ "$ID" == "ubuntu" ]; then
                        echo "======================="
                        echo "IT'S UBUNTU"
                        git clone https://github.com/JAGANNATHDEVOPS/JENKINS-TUTORIAL.git
                        sudo cp -r JENKINS-TUTORIAL/jenkins-installation /etc/ansible/roles/
                        sudo rm -rf /etc/ansible/roles/jenkins-installation/tasks/main.yml
                        sudo cp JENKINS-TUTORIAL/jenkins-install-in-both-ubuntu-amazon-linux.yml JENKINS-TUTORIAL/jenkins-installation/tasks/main.yml
                        sudo ansible-playbook ./jenkins-install-ubuntu.yml
                        echo "======================="
                        exit 0
                elif [ "$ID" == "amzn" ]; then
                        echo "======================="
                        echo "IT'S AMAZON LINUX"
                        echo "======================="
                        sudo yum install git -y
                        git clone https://github.com/JAGANNATHDEVOPS/JENKINS-TUTORIAL.git
                        cp JENKINS-TUTORIAL/jenkins-install-in-both-ubuntu-amazon-linux.yml JENKINS-TUTORIAL/jenkins-installation/tasks/main.yml
                        ansible-playbook ./jenkins-install.yml
                        exit 0
                fi
        fi
fi
