
## Table of Contents

- [Usage](#usage)
- [Common Use Cases](#common-use-cases)
- [Outputs](#outputs)

## Usage

### Quick Start (3 Steps)

### Step 1: Use the Module

```hcl
module "ami" {
  source = "../../../module"

  ami_owners      = ["123456789012"]
  ami_name_filter = "Windows_Server-2019-English-Full-Base-*"
}
```

### Step 2: Use AMI in EC2

```hcl
module "ec2" {
  source = "../../../modules/ec2"
  
  ami_id = module.ami.ami_id  # ← Use this output
  # ... other config
}
```

### Step 3: Deploy

```bash
terraform init
terraform plan
terraform apply
```

## Common Use Cases

### Use Case 1: Development

```hcl
module "ami_dev" {
  source = "../../module/"

  ami_owners      = "123456789012"
  ami_name_filter = "amzn2-ami-hvm-*-x86_64-gp2"
  ami_tag_filters = {
    environment = dev
    version     = 1.1.1
  }
}
```

### Use Case 2: Production (Specific Golden Image)

```hcl
module "ami_prod" {
  source = "../../module/"

  ami_owners      = ["123456789012"]
  ami_name_filter = "prod-golden-v2.1.0"
  
  ami_tag_filters = {
    environment = "production"
    Approved    = "true"
    version     = "2.1.0"
    SHA         = "abc123"
  }
}
```

### Use Case 3: Multi-Account Shared AMIs

```hcl
module "ami_shared" {
  source = "../../module/"

  ami_owners = [
    "123456789012",  # Account A
    "987654321098"   # Account B
  ]
  
  ami_tag_filters = {
    SharedService = "platform"
  }
}
```

### Use Case 4: ARM64 Instances

```hcl
module "ami_graviton" {
  source = "../../module/"

  ami_owners      = ["123456789012"]
  ami_name_filter = "prod-golden-v2.1.0"
  architecture = "arm64"
}
```

## Inputs

## Outputs

### Essential Outputs (Use these!)

```hcl
module.ami.ami_id              # For EC2: ami-0123456789abcdef0
module.ami.ami_name            # ubuntu/images/hvm-ssd/ubuntu-...
module.ami.default_ssh_user    # ubuntu (or ec2-user, Administrator)
```

### Metadata Outputs

```hcl
module.ami.ami_architecture        # x86_64 or arm64
module.ami.ami_creation_date       # 2026-01-15T10:30:00.000Z
module.ami.ami_owner_id            # 099720109477
module.ami.ami_virtualization_type # hvm
module.ami.ami_root_device_type.   # ebs
```