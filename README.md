# Infrastructure as Code with Terraform

This repository contains Terraform configuration to deploy a virtual machine instance on Google Cloud Platform with SSH access.

## Prerequisites

- Terraform installed
- Google Cloud account and project
- SSH key pair

## Setup

1. Clone this repository
2. Copy `terraform.tfvars.example` to `terraform.tfvars`
3. Edit `terraform.tfvars` with your own values:
   - `project_id`: Your Google Cloud project ID
   - `region`: Your preferred GCP region
   - `zone`: Your preferred GCP zone
   - `ssh_user`: Username for SSH access
   - `ssh_pub_key`: Path to your SSH public key
4. Authenticate with Google Cloud: `gcloud auth application-default login`
5. Initialize Terraform: `terraform init`
6. Apply the configuration: `terraform apply`

## Resources Created

- Google Compute Engine VM instance with public IP
- SSH access configured with your public key