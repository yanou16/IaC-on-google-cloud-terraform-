# Infrastructure as Code with Terraform and Ansible

This project combines Terraform and Ansible to automatically deploy and configure a complete infrastructure on Google Cloud Platform:
1. VM provisioning with Terraform
2. Configuration and deployment of a Node.js application with Ansible

<img width="1563" height="422" alt="image" src="https://github.com/user-attachments/assets/7b95f2a9-2adf-4ad4-9282-7ae4b3f6c222" />

## Architecture

- **Infrastructure**: Google Cloud VM (Compute Engine)
- **Configuration**: Ansible for Node.js installation and application deployment
- **Application**: Node.js/Express web service exposed on port 80

## Prerequisites

- Terraform installed
- Ansible installed
- Google Cloud account and configured project
- SSH key pair

## Infrastructure Deployment with Terraform

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

## Configuration and Deployment with Ansible

### Inventory Configuration

The Ansible inventory (`ansible/inventory.ini`) is configured with the IP address of the VM created by Terraform:

```ini
[servers]
34.12.103.216

[servers:vars]
ansible_user=enyare
ansible_ssh_private_key_file=/home/enyare/.ssh/id_rsa
ansible_python_interpreter=/usr/bin/python3
```

### Node.js Application Deployment

The `node_service.yml` playbook deploys a Node.js application using two roles:

1. **nodejs role**: Installs Node.js and npm on the server
2. **app role**: Deploys the application
   - Clones the GitHub repository
   - Creates a directory for the Node.js application
   - Creates app.js and package.json files
   - Installs dependencies with npm
   - Configures a systemd service to run the application

To deploy the application:

```bash
ansible-playbook -i ansible/inventory.ini ansible/node_service.yml
```

To deploy only the application without reinstalling Node.js:

```bash
ansible-playbook -i ansible/inventory.ini ansible/node_service.yml --tags app
```

## Deployment Verification

To verify that the application is working correctly:

```bash
curl http://34.12.103.216:80
```

You should see the response "Hello, world!".

To check the service status:

```bash
ssh enyare@34.12.103.216 "sudo systemctl status app"
```

## Resources Created

- Google Compute Engine VM instance with public IP
- SSH access configured with your public key
- Node.js/Express application deployed and running as a systemd service
- Web service accessible on port 80
