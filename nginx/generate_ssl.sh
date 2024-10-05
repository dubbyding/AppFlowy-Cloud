#!/bin/bash

# Set variables
DOMAIN="appflowy.rajmaharjan.com"
CERT_DIR="./ssl"

# Create the ssl directory if it doesn't exist
mkdir -p $CERT_DIR

# Generate private key
openssl genrsa -out $CERT_DIR/private_key.key 2048

# Generate CSR (Certificate Signing Request)
openssl req -new -key $CERT_DIR/private_key.key -out $CERT_DIR/csr.pem -subj "/CN=$DOMAIN"

# Generate self-signed certificate
openssl x509 -req -days 365 -in $CERT_DIR/csr.pem -signkey $CERT_DIR/private_key.key -out $CERT_DIR/certificate.crt

# Clean up CSR file
rm $CERT_DIR/csr.pem

echo "SSL certificates generated successfully in $CERT_DIR"