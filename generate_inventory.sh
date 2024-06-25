#!/bin/bash

if [ "$#" -ne 2 ]; then
  echo "Usage: $0 $backend_ip $frontend_ip"
  exit 1
fi

backend_ip=$1
frontend_ip=$2

# Create the ansible inventory directory if it doesn't exist
mkdir -p ansible/inventory

# Create the hosts file if it doesn't exist
touch ansible/inventory/hosts

# Write the inventory to the hosts file
cat <<EOL > ansible/inventory/hosts
[backend]
$backend_ip

[frontend]
$frontend_ip
EOL
