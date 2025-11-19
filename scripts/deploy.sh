#!/bin/bash
# deploy.sh - terraform deploy helper (requires terraform + AWS creds)
set -e

TF_DIR="$(dirname "$0")/../terraform"

# if terraform folder doesn't exist or is empty, exit gracefully
if [ ! -d "$TF_DIR" ] || [ -z "$(ls -A "$TF_DIR" 2>/dev/null)" ]; then
  echo "No Terraform files found in ${TF_DIR}. Add Terraform files first."
  exit 0
fi

cd "$TF_DIR"
echo "Initializing Terraform..."
terraform init -input=false

echo "Planning..."
terraform plan -input=false

echo "Applying Terraform (auto-approve)..."
terraform apply -auto-approve -input=false

echo "Fetching Terraform outputs (public_ip if present):"
terraform output -raw public_ip || echo "No public_ip output found."
