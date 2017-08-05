#!/bin/bash
echo "I'm in."
echo "Checking files..."
if [ -f /var/log ]
    then
        echo "/var/log exists."
fi
echo "done."
if [ "$(whoami)" != 'root' ]; then
    echo "You have no permission to run $0."
else
    echo "Hi, you are my best amigo."
fi
