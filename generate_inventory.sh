#!/bin/bash

# Verificar se os parâmetros foram passados corretamente
if [ "$#" -ne 2 ]; then
    echo "Uso: $0 <backend_instance_ip> <frontend_instance_ip>"
    exit 1
fi

backend_ip=$1
frontend_ip=$2

# Criar o diretório ansible/inventory se não existir
mkdir -p ansible/inventory

# Criar ou sobrescrever o arquivo hosts com as IPs fornecidas
cat <<EOF > ansible/inventory/hosts
[backend]
$backend_ip

[frontend]
$frontend_ip
EOF

echo "Arquivo de inventário gerado em ansible/inventory/hosts"
