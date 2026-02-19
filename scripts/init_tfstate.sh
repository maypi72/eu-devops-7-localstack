#!/usr/bin/env bash
set -e

# --- Variables de entorno ---
export AWS_SECRET_ACCESS_KEY=test
export AWS_ACCESS_KEY_ID=test
export AWS_DEFAULT_REGION=eu-west-1

# --- Valores configurables ---
BUCKET_NAME="la-huella-remote-state"
ENDPOINT="http://midominio.local"

echo "Creando bucket S3 para Terraform remote state: $BUCKET_NAME"
echo "Endpoint: $ENDPOINT"
echo

# --- Crear bucket ---
aws --endpoint-url="$ENDPOINT" s3api create-bucket \
  --bucket "$BUCKET_NAME" \
  --create-bucket-configuration LocationConstraint=eu-west-1

echo
echo "✔ Bucket creado correctamente"
echo "Buckets disponibles:"
aws --endpoint-url="$ENDPOINT" s3api list-buckets
``