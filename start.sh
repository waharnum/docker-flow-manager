#!/bin/sh -e

if [ -z "$NODE_ENV" ]; then
    echo >&2 'Error: The NODE_ENV environment variable needs to be set'
    exit 1
fi

PREFERENCES_SERVER_HOST_ADDRESS=${PREFERENCES_SERVER_HOST_ADDRESS:-"preferences.gpii.net"}
STMM_HOST_ADDRESS=${STMM_HOST_ADDRESS:-"stmm.gpii.net"}
RBMM_HOST_ADDRESS=${RBMM_HOST_ADDRESS:-"rbmm.gpii.net"}

sed -i "s/preferences.gpii.net/${PREFERENCES_SERVER_HOST_ADDRESS}/g" /opt/universal/gpii/configs/cloudBased.production.json
sed -i "s/stmm.gpii.net/${STMM_HOST_ADDRESS}/g" /opt/universal/gpii/configs/cloudBased.production.json
sed -i "s/rbmm.gpii.net/${RBMM_HOST_ADDRESS}/g" /opt/universal/gpii/configs/cloudBased.production.json

cat >/etc/supervisord.d/flow_manager.ini<<EOF
[program:flow_manager]
command=node /opt/universal/gpii.js
environment=NODE_ENV="${NODE_ENV}"
user=nobody
autorestart=true
redirect_stderr=true
stdout_logfile=/dev/stdout
stdout_logfile_maxbytes=0
EOF

supervisord -c /etc/supervisord.conf
