#AMI module input variables

#========== OPERATING SYSTEM SELECTION ==========

variable "region" {
  description = "AWS region to search for AMIs"
  type        = string
  default     = "eu-west-2"
  
}
variable "os_type" {
  description = "Operating system type"
  type        = string

  validation {
    condition = contains([
      "amazon-linux",
      "ubuntu",
      "rhel",
      "centos",
      "windows",
      "custom"
    ], var.os_type)
    error_message = "Invalid os_type. Must be one of: amazon-linux-2, amazon-linux-2023, ubuntu-20.04, ubuntu-22.04, ubuntu-24.04, rhel-8, rhel-9, centos-7, rocky-8, rocky-9, windows-2019, windows-2022, custom"
  }
}

variable "os_version" {
  description = "Optional OS version tag to filter (e.g., '8.5', '22.04')"
  type        = string
  default     = null
}

#========== AMI SEARCH CRITERIA ==========

variable "most_recent" {
  description = "Return the most recent AMI"
  type        = bool
  default     = true
}

variable "ami_owners" {
  description = "List of AMI owner account IDs. If null, uses default for OS type"
  type        = list(string)
  default     = null

  validation {
    condition     = var.ami_owners == null || length(var.ami_owners) > 0
    error_message = "If specified, ami_owners must contain at least one account ID."
  }
}

variable "ami_name_filter" {
  description = "Custom AMI name filter pattern. If null, uses default for OS type"
  type        = string
  default     = null
}

variable "ami_tag_filters" {
  description = "Map of tag name to tag value for filtering AMIs"
  type        = map(string)
  default     = {}
}

#========== AMI ATTRIBUTES ==========

variable "architecture" {
  description = "AMI architecture (x86_64 or arm64)"
  type        = string
  default     = "x86_64"

  validation {
    condition     = contains(["x86_64", "arm64"], var.architecture)
    error_message = "Architecture must be x86_64 or arm64."
  }
}

variable "virtualization_type" {
  description = "AMI virtualization type"
  type        = string
  default     = "hvm"

  validation {
    condition     = contains(["hvm", "paravirtual"], var.virtualization_type)
    error_message = "Virtualization type must be hvm or paravirtual."
  }
}

variable "root_device_type" {
  description = "AMI root device type"
  type        = string
  default     = "ebs"

  validation {
    condition     = contains(["ebs", "instance-store"], var.root_device_type)
    error_message = "Root device type must be ebs or instance-store."
  }
}

#========== METADATA ==========

variable "project_name" {
  description = "Project name for tagging and identification"
  type        = string
  default     = ""
}

variable "environment" {
  description = "Environment name (dev, staging, prod)"
  type        = string
  default     = ""

  validation {
    condition     = var.environment == "" || contains(["dev", "staging", "prod"], var.environment)
    error_message = "Environment must be dev, staging, or prod."
  }
}

variable "tags" {
  description = "Additional tags to apply to resources"
  type        = map(string)
  default     = {}
}