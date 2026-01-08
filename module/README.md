# Terraform Module: Amazon Machine Image

## Table of Contents

- [Overview](#overview)
- [Features](#Features)
- [Requirements](#Requirements)
- [Usage](#usage)
- [Configuration Guide](#configuration-guide)
- [Examples](#examples)
- [Inputs](#inputs)
- [Outputs](#outputs)
- [Notes](#notes)

## Overview

A **enterprise-grade AWS AMI data source module** that:

- ✅ Finds and selects AMIs based on owner, ami name, tags
- ✅ Integrates seamlessly with EC2 and Auto Scaling Groups
- ✅ Comprehensive documentation and examples
- ✅ Multi-architecture support (x86_64, ARM64)

## Features

### 1. **Custom Golden Image Filtering**

```hcl
ami_owners      = ["123456789012"]
ami_name_filter = "golden-image-webserver-*"

ami_tag_filters = {
  Environment = "production"
  Version     = "2.1.0"
  Hardened    = "true"
}
```

### 2. **Architecture Support**
```hcl
architecture = "arm64"  
```

### 3. **Automatic Metadata**
```hcl
# Module automatically provides:
- ami_id                  # For EC2 instances
- ami_name                # For documentation
- default_ssh_user        # ubuntu, ec2-user, etc.
- ami_creation_date       # When AMI was created
```

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.5.6 |
| aws | >= 5.22 |


## Usage

### Basic Usage

```hcl

```

## Configuration Guide

### Basic Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `project_name` | string | - | Project name (required) |
| `environment` | string | - | Environment (dev, staging, prod) |
| `bucket_name` | string | "" | Bucket name (auto-generated if empty) |
| `tags` | map | {} | Common tags |

### Versioning

Enable versioning for data protection and recovery:

```hcl
enable_versioning = true
enable_mfa_delete = false  # Requires root account setup
```

### Replication (Disaster Recovery)

### CORS Configuration

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| `most_recent` | Return the most recent AMI | `bool` | `true` | no |
| `ami_owners` | List of AMI owner account IDs | `list(string)` | `null` | yes |
| `ami_name_filter` | Custom AMI name filter pattern | `string` | `null` | yes |
| `ami_tag_filters` | Map of tag filters | `map(string)` | `{}` | no |
| `architecture` | AMI architecture (x86_64 or arm64) | `string` | `"x86_64"` | no |
| `virtualization_type` | AMI virtualization type | `string` | `"hvm"` | no |
| `root_device_type` | AMI root device type | `string` | `"ebs"` | no |


## Module Outputs

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
module.ami.ami_description         # Canonical, Ubuntu, 22.04 LTS...
```

## Outputs

### Primary Outputs (Use these for EC2/ASG)

| Name | Description |
|------|-------------|
| `ami_id` | Selected AMI ID (use for EC2 instances) |
| `ami_name` | Selected AMI name |
| `ami_owner_id` | AMI owner account ID |
| `ami_architecture` | AMI architecture |
| `ami_virtualization_type` | Virtualization type |
| `ami_root_device_type` | Root device type |
| `ami_creation_date` | AMI creation date |

## Examples

See the `examples/` directory for complete working examples:

- `examples/example-usage/simple-amazon-linux/` - Amazon Linux example
- `examples/example-usage/ec2_ami-integartion/` - shows ec2 module integration
- `examples/example-usage/custom-golden-image/` - Custom AMI with tags
- `examples/example-usage/multi-env/` - Multiple AMI types

## Testing

```bash
# Initialize
terraform init

# Validate
terraform validate

# Plan
terraform plan

# Check outputs
terraform apply
terraform output ami_id

## Notes