#!/bin/sh -e

#PRIVATE_KEY="example.org.node-private-key.pem"
CERTIFICATE="${1}"
#AUTHORITY_CERTIFICATE="example.org.intermediate-certificate.pem"
#OUTPUT_FILE="server.pfx"

# This is for using a client certificate
# convert PEM key to PKCS12
#openssl pkcs12 -export -out "${OUTPUT_FILE}" -inkey "${PRIVATE_KEY}" -in "${NODE_CERTIFICATE}" -certfile "${AUTHORITY_CERTIFICATE}"

CERTIFICATE_NAME=$(basename "${CERTIFICATE%.*}")
openssl pkcs12 -export -in "${CERTIFICATE}" -out "${CERTIFICATE_NAME}.p12" -name "My Certificate"

# GnuTLS can do this too.
#certtool --to-pk12
