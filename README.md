# Proxmox Laboratory

## Provisioning resources using Terraform

```bash
cd infra
```

First, make sure that the **remote backend** which will hold the Terraform **state** exists by running the ./create-backend-state.ps1 script. This script is written in PowerShell and it will **idempotently** create a storage account container in your Azure subscription for the state. Make sure to pass the parameters accordingly.

Then, set the **PROXMOX_VE_USERNAME** and **PROXMOX_VE_PASSWORD** environment variables.

Using PowerShell:

```bash
$env:PROXMOX_VE_USERNAME="<your_username>"
$env:PROXMOX_VE_PASSWORD="<your_password>"
```

Using bash:

```bash
export PROXMOX_VE_USERNAME="<your_username>"
export PROXMOX_VE_PASSWORD="<your_password>"
```

After setting the environment variables, run the following Terraform commands:

```bash
terraform init
terraform validate
terraform plan -out tfplan
terraform apply tfplan
```
