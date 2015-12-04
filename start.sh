#!/bin/sh -e

# Create an Ansible variables file for run.yml based on environment variables passed to the container

cat > runtime_vars.yml<<EOF
---
gpii_flow_manager_preferences_server_host_address: $PREFERENCES_SERVER_HOST_ADDRESS
gpii_flow_manager_environment: $NODE_ENV
gpii_flow_manager_rbmm_host_address: $RBMM_HOST_ADDRESS
gpii_flow_manager_stmm_host_address: $STMM_HOST_ADDRESS
EOF

ansible-playbook run.yml --tags "deploy" && supervisord -n -c /etc/supervisord.conf
