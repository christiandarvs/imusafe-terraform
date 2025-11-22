# ImuSafe Terraform

This Terraform configuration deploys the **ImuSafe API** on an AWS EC2 instance with:

- EC2 instance (Ubuntu recommended)
- Security Group (HTTP, SSH, FastAPI port 8000)
- Elastic IP
- Initialization script (`init_script.sh`)
- 50GB gp3 storage

## File Structure

``` bash
├── init_script.sh
├── main.tf
├── outputs.tf
├── README.md
├── terraform_graph
├── terraform_graph.png
├── terraform.tf
├── terraform.tfstate
├── terraform.tfstate.backup
└── variables.tf
```

## Terraform Graph

![Terraform Graph](./terraform_graph.png) 
---

## 🚀 Deploying with Terraform

### 1. Initialize Terraform

```bash
terraform init
```

### 2. Preview resources

```bash
terraform plan
```

### 3. Apply changes

```bash
terraform apply
```

