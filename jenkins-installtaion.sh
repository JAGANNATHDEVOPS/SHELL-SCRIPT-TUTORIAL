#!/bin/bash
update_packages_on_ubuntu() {
        echo "UPDATING THE PACKAGES IN UBUNTU"
        sudo apt update
}
update_packages_on_amazon_linux() {
        echo "UPDATING THE PACKAGES IN AMAZON LINUX"
        sudo yum update -y
}
install_required_packages_on_ubuntu() {
        echo "INSTALL THE PACKAGES IN UBUNTU"
        sudo apt-get install software-properties-common ansible python-apt -y
}

install_python3_pip_on_amazon_linux() {
        echo "INSTALLING python3-pip IN AMAZON LINUX"
        sudo dnf install python3-pip -y
}

add_repository_on_ubuntu() {
        echo "ADD APT REPOSITORY IN UBUNTU"
        sudo add-apt-repository --yes --update ppa:ansible/ansibl
}
update_packages_on_ubuntu() {
        echo "UPDATING THE PACKAGES IN UBUNTU"
        sudo apt update
}
update_packages_on_amazon_linux() {
        echo "UPDATING THE PACKAGES IN AMAZON LINUX"
        sudo yum update -y
}
install_ansible_on_ubuntu() {
        echo "INSTALL THE PACKAGES IN UBUNTU"
        sudo apt-get install ansible -y
}
install_ansible_on_amazon_linux() {
        echo "INSTALL ANSIBLE ON AMAZON LINUX"
        pip install ansible
}
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
                        update_packages_on_ubuntu
                        install_required_packages_on_ubuntu
                        add_repository_on_ubuntu
                        update_packages_on_ubuntu
                        install_ansible_on_ubuntu
                        echo "======================="
                        exit 0
                elif [ "$ID" == "amzn" ]; then
                        echo "======================="
                        echo "IT'S AMAZON LINUX"
                        echo "======================="
                        update_packages_on_amazon_linux
                        install_python3_pip_on_amazon_linux
                        update_packages_on_amazon_linux
                        install_ansible_on_amazon_linux
                        sh ./SHELL-SCRIPT-TUTORIAL/call-ansible-role-to-install-jenkins.sh
                        exit 0
                fi
        fi
fi
