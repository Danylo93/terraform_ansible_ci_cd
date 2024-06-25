#!/bin/bash

# Execute o Terraform e capture as saídas
cd terraform
backend_ip=$(terraform output -raw backend_instance_ip)
frontend_ip=$(terraform output -raw frontend_instance_ip)
cd ..

# Crie o inventário do Ansible
cat <<EOL > ansible/inventory/hosts
[backend]
backend_instance ansible_host=$backend_ip ansible_user=ubuntu

[frontend]
frontend_instance ansible_host=$frontend_ip ansible_user=ubuntu
EOL

echo "Arquivo de inventário gerado em ansible/inventory/hosts"