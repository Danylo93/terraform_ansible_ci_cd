#!/bin/bash

# Executar Terraform para aplicar a infraestrutura
cd terraform
terraform init
terraform apply -auto-approve
cd ..

# Gerar inventário do Ansible
./generate_inventory.sh

# Executar Ansible para provisionar as instâncias
ansible-playbook -i ansible/inventory/hosts ansible/playbooks/backend.yml
ansible-playbook -i ansible/inventory/hosts ansible/playbooks/frontend.yml
