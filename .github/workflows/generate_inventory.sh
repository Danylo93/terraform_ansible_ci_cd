#!/bin/bash

# Gera o output do Terraform e salva em uma variável
IP=$(terraform output -raw instance_ip)

# Cria um arquivo de inventário do Ansible com o IP da instância
echo "[meu_servidor]" > ansible_inventory
echo "$IP ansible_user=ubuntu" >> ansible_inventory

# O arquivo 'ansible_inventory' agora pode ser usado pelo Ansible
