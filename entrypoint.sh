#!/bin/bash

set -ex

echo ${LOCAL_CERT} > localhost.pem
echo ${LOCAL_KEY} > localhost-key.pem

grpcwebproxy --run_tls_server=true --server_tls_cert_file=localhost.pem --server_tls_key_file=localhost-key.pem --backend_addr=167.172.180.70:9290 --backend_tls=false --allow_all_origins