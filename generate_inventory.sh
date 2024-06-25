#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <backend_instance_ip> <frontend_instance_ip>"
    exit 1
fi

BACKEND_IP=$1
FRONTEND_IP=$2

cat <<EOF > ansible/inventory/hosts
[backend]
$BACKEND_IP

[frontend]
$FRONTEND_IP
EOF
