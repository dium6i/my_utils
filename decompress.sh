#!/bin/bash
set -e

if [ ! -d /usr/local/lib/python3.12/site-packages ]; then
    echo "Decompressing data..."
    tar -zxf /usr/local/lib/python3.12/sp.tar.gz -C /usr/local/lib/python3.12
    rm -f /usr/local/lib/python3.12/sp.tar.gz
    echo "Data decompression completed!"
else
    echo "Data already exists, skipping decompression."
fi

exec "$@"
