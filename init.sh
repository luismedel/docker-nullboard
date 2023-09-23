#!/bin/sh

TOKEN=$(cat /data/app-config.json | jq -r ' .auth')

if ! [[ $TOKEN ]]; then
    TOKEN=$(uuidgen)
    echo
    echo " > Injecting first-time random auth token $TOKEN into Nullboard..."
    echo
    sed -i "s/const DEFAULT_LOCAL_AUTH \= ''/const DEFAULT_LOCAL_AUTH = '$TOKEN'/" /www/index.html
    lighttpd -f ./lighttpd.conf & nbagent --data /data --override-token $TOKEN && fg
else
    lighttpd -f ./lighttpd.conf & nbagent --data /data && fg
fi
