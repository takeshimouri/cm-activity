#!/bin/sh

set -e

# host="$1"
# shift
# user="$1"
# shift
# password="$1"
# shift
cmd="$@"

echo "Waiting for mysql 5 seconds..."
sleep 5 

exec $cmd