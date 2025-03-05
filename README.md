# Proxmox Laboratory

## Provisioning resources using Terraform

```bash
cd infra
```

Then, set the PROXMOX_VE_USERNAME and PROXMOX_VE_PASSWORD environment variables.

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
