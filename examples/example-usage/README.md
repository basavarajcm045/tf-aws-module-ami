# Terraform Module: Amazon Machine Image (AMI)

## Table of Contents

- [Overview](#overview)
- [Features](#Features)
- [Requirements](#Requirements)
- [Usage](#usage)
  - [Simple Storage Service](#simple-storage-service)
- [Configuration Guide](#configuration-guide)
- [Examples](#examples)
- [Inputs](#inputs)
- [Outputs](#outputs)
- [Notes](#notes)

## Features


## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.5.6 |
| aws | >= 5.22 |

## Usage

## Quick Start (3 Steps)

### Step 1: Use the Module

```hcl
module "ami" {
  source = "../../../module"

  os_type = "ubuntu"
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

### Use Case 1: Development (Latest Public AMI)

```hcl
module "ami_dev" {
  source = "../../module"

  os_type      = "amazon-linux"
  project_name = "myapp"
  environment  = "dev"
}
```

### Use Case 2: Production (Specific Golden Image)

```hcl
module "ami_prod" {
  source = "./modules/ami"

  os_type         = "custom"
  ami_owners      = ["123456789012"]
  ami_name_filter = "prod-golden-v2.1.0"
  
  ami_tag_filters = {
    Environment = "production"
    Approved    = "true"
    SHA         = "abc123"
  }
}
```

### Use Case 3: Multi-Account Shared AMIs

```hcl
module "ami_shared" {
  source = "./modules/ami"

  os_type    = "custom"
  ami_owners = [
    "123456789012",  # Account A
    "987654321098"   # Account B
  ]
  
  ami_tag_filters = {
    SharedService = "platform"
  }
}
```

### Use Case 4: ARM64 (Graviton) Instances

```hcl
module "ami_graviton" {
  source = "./modules/ami"

  os_type      = "amazon-linux-2023"
  architecture = "arm64"
}
```

### Use Case 1: Development (Latest Public AMI)


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

### Encryption

**AES256 (Default)**
```hcl
encryption_type = "aes256"
```

**KMS (Recommended for sensitive data)**
```hcl
encryption_type = "kms"
kms_key_id      = ""  # Auto-create or provide existing key
bucket_key_enabled = true  # Reduces KMS API calls
```

### Public Access Control

Block all public access (recommended):

```hcl
acl                     = "private"
block_public_acls       = true
block_public_policy     = true
ignore_public_acls      = true
restrict_public_buckets = true
```

Allow public read-only:

```hcl
acl                     = "public-read"
block_public_acls       = false
block_public_policy     = false
ignore_public_acls      = false
restrict_public_buckets = false
```
### Logging Configuration

Enable access logging for audit trails:

```hcl
enable_logging     = true
log_prefix         = "access-logs/"
log_retention_days = 2555  # 7 years
```

### Lifecycle Rules

Archive and delete objects based on age:

```hcl
lifecycle_rules = [
  {
    id      = "archive-old-objects"
    enabled = true
    prefix  = ""
    
    # Transition to cheaper storage
    transitions = [
      {
        days          = 30
        storage_class = "STANDARD_IA"
      },
      {
        days          = 90
        storage_class = "GLACIER"
      },
      {
        days          = 365
        storage_class = "DEEP_ARCHIVE"
      }
    ]

    
    # Delete after 7 years
    expiration = {
      days = 2555
    }
    
    # Clean old versions
    noncurrent_version_expiration = {
      noncurrent_days = 90
    }
    
    # Clean incomplete uploads
    abort_incomplete_multipart_upload = {
      days_after_initiation = 7
    }
  }
]
```

### Object Lock (Compliance)

Prevent object deletion for regulatory requirements:

```hcl
enable_object_lock       = true
object_lock_default_mode = "COMPLIANCE"  # or "GOVERNANCE"
object_lock_default_years = 7
```

### Replication (Disaster Recovery)


### CORS Configuration

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| `create` | Controls if resources should be created (affects nearly all resources) | `any` | n/a | yes |
| `tags` | A map of tags to add to all resources | `map(string)` | n/a | yes |
| `access_logs` | Map containing access logging configuration for load balancer. | `map(any)` | n/a | yes |
| `connection_logs` | Map containing access logging configuration for load balancer | `map(any)` | n/a | yes |
| `ipam_pools` | The IPAM pools to use with the load balancer | `list(string)` | n/a | yes |
| `client_keep_alive` | Client keep alive value in seconds. The valid range is 60-604800 seconds. The default is 3600 seconds. | `number` | n/a | yes |
| `customer_owned_ipv4_pool` | The ID of the customer owned ipv4 pool to use for this load balancer | `string` | n/a | yes |
| `desync_mitigation_mode` | Determines how the load balancer handles requests that might pose a security risk to an application due to HTTP desync. Valid values are `monitor`, `defensive` (default), `strictest` | `string` | n/a | yes |
| `dns_record_client_routing_policy` | Indicates how traffic is distributed among the load balancer Availability Zones. Only valid for network type load balancers. | `string` | n/a | yes |
| `drop_invalid_header_fields` | Whether invalid HTTP headers are removed or routed to targets. Only valid for `application` type. | `bool` | n/a | yes |
| `enable_cross_zone_load_balancing` | Enables cross-zone load balancing. Always `true` for application load balancers. | `bool` | n/a | yes |
| `enable_deletion_protection` | Disables deletion via API if set to `true`. | `bool` | n/a | yes |
| `enable_http2` | Whether HTTP/2 is enabled in ALB. | `bool` | n/a | yes |
| `enable_tls_version_and_cipher_suite_headers` | Adds TLS version/cipher headers for ALB. | `bool` | n/a | yes |
| `enable_waf_fail_open` | Allows routing when WAF fails. | `bool` | n/a | yes |
| `enable_xff_client_port` | Preserves source port in X-Forwarded-For header (ALB). | `bool` | n/a | yes |
| `enable_zonal_shift` | Whether zonal shift is enabled. | `bool` | n/a | yes |
| `idle_timeout` | Idle timeout in seconds (ALB only). | `number` | n/a | yes |
| `internal` | Whether the LB is internal. | `bool` | n/a | yes |
| `ip_address_type` | `ipv4` or `dualstack`. | `string` | n/a | yes |
| `load_balancer_type` | `application`, `gateway`, or `network`. | `string` | n/a | yes |
| `enforce_security_group_inbound_rules_on_private_link_traffic` | Whether SG inbound rules apply to PrivateLink traffic. (NLB only) | `string` | n/a | yes |
| `minimum_load_balancer_capacity` | Minimum capacity (ALB/NLB only). | `number` | n/a | yes |
| `name` | Unique LB name (max 32 chars). | `string` | n/a | yes |
| `name_prefix` | Prefix for LB name (conflicts with `name`). | `string` | n/a | yes |
| `preserve_host_header` | Preserves Host header (ALB). | `bool` | n/a | yes |
| `security_groups` | List of security group IDs. | `list(string)` | n/a | yes |
| `subnet_mapping` | List of subnet mapping blocks. | `list(map(string))` | n/a | yes |
| `subnets` | List of subnet IDs. | `list(string)` | n/a | yes |
| `xff_header_processing_mode` | How to modify X-Forwarded-For header. | `string` | n/a | yes |
| `timeouts` | Timeout configuration map. | `map(string)` | n/a | yes |
| `default_port` | Default port for listener/target group. | `number` | n/a | yes |
| `default_protocol` | Default protocol for listener/target group. | `string` | n/a | yes |
| `listeners` | Map of listener configurations. | `map(any)` | n/a | yes |
| `target_groups` | Map of target group configurations. | `map(any)` | n/a | yes |
| `additional_target_group_attachments` | Map of extra target group attachments. | `map(any)` | n/a | yes |
| `create_security_group` | Whether to create a security group. | `bool` | n/a | yes |
| `security_group_name` | Name for created security group. | `string` | n/a | yes |
| `security_group_use_name_prefix` | Whether SG name is a prefix. | `bool` | n/a | yes |
| `security_group_description` | Description for created SG. | `string` | n/a | yes |
| `vpc_id` | VPC ID for created SG. | `string` | n/a | yes |
| `security_group_ingress_rules` | Ingress rules for created SG. | `list(map(string))` | n/a | yes |
| `security_group_egress_rules` | Egress rules for created SG. | `list(map(string))` | n/a | yes |
| `security_group_tags` | Additional tags for created SG. | `map(string)` | n/a | yes |
| `route53_records` | Map of Route53 records to create. | `map(any)` | n/a | yes |
| `associate_web_acl` | Whether to associate WAF ACL. | `bool` | n/a | yes |
| `web_acl_arn` | WAF ARN for association. | `string` | n/a | yes |


## Outputs

| Name                     | Description                                                  |
|--------------------------|--------------------------------------------------------------|
| `id`                     | The ID and ARN of the load balancer we created               |
| `arn`                    | The ID and ARN of the load balancer we created               |
| `dns_name`               | The DNS name of the load balancer                             |
| `arn_suffix`             | ARN suffix of our load balancer - can be used with CloudWatch |
| `zone_id`                | The zone_id of the load balancer to assist with creating DNS records |
| `listeners`              | Map of listeners created and their attributes                |
| `listener_arns`          | Map of listener ARNs, keyed by listener name                  |
| `listener_ids`           | Map of listener IDs, keyed by listener name                   |
| `listener_rules`         | Map of listeners rules created and their attributes           |
| `target_groups`          | Map of target groups created and their attributes             |
| `target_group_arns`      | Map of target group ARNs, keyed by target group name           |
| `target_group_ids`       | Map of target group IDs, keyed by target group name            |
| `target_group_attachments` | ARNs of the target group attachment IDs                     |
| `security_group_arn`     | Amazon Resource Name (ARN) of the security group              |
| `security_group_id`      | ID of the security group                                      |
| `route53_records`        | The Route53 records created and attached to the load balancer |

## Notes
-	Weighted Forwarding is only available for Application Load Balancers. Weighted forwarding requires actions with multiple target_groups and weight values.
-	If using HTTPS, ensure an ACM certificate is available in the same region.
-	Target group protocols must match listener protocols in supported combinations.
- WAFv2 is only supported for ALB.
- Ensure the subnets belong to the same VPC.
- For detailed use case, please refer example folder