#!/bin/bash

if [ $# -ne 2 ]; then
  echo "Usage: $0 <backend_instance_ip> <frontend_instance_ip>"
  exit 1
fi

backend_instance_ip=$1
frontend_instance_ip=$2

# Cria o diretório de inventário, se não existir
mkdir -p ansible/inventory

# Escreve as informações no arquivo de inventário
cat <<EOL > ansible/inventory/hosts
[backend]
$backend_instance_ip

[frontend]
$frontend_instance_ip
EOL

echo "Ansible inventory file generated at ansible/inventory/hosts"
