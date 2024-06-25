#!/bin/bash

backend_ip=$1
frontend_ip=$2

if [[ -z "$backend_ip" || -z "$frontend_ip" ]]; then
  echo "Usage: $0 <backend_instance_ip> <frontend_instance_ip>"
  exit 1
fi

cat <<EOL > ansible/inventory/hosts
[backend]
$backend_ip

[frontend]
$frontend_ip
EOL
