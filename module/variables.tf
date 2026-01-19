#AMI module input variables

variable "os_type" {
  description = "Operating system type"
  type        = string
  default     = "custom"

}

/*variable "os_version" {
  description = "Optional OS version tag to filter (e.g., '8.5', '22.04')"
  type        = string
  default     = null
}*/

#========== AMI SEARCH CRITERIA ==========

variable "most_recent" {
  description = "Return the most recent AMI"
  type        = bool
  default     = true

  validation {
    condition = (
      var.most_recent || var.ami_name_filter != null
    )
    error_message = "When most_recent=false, ami_name_filter must be specified."
  }
}

variable "ami_owners" {
  description = "List of AMI owner account IDs. If null, uses default"
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

  /*validation {
    condition     = var.ami_name_filter == null ||length(trim(var.ami_name_filter)) > 0
    error_message = "ami_name_filter must not be empty."
  }*/
}

variable "ami_tag_filters" {
  description = "Map of tag name to tag value for filtering AMIs"
  type        = map(string)
  default     = {}
}

variable "architecture" {
  description = "AMI architecture (x86_64 or arm64)"
  type        = string
  default     = null

  validation {
    condition = (
      var.architecture == null || contains(["x86_64", "arm64"], var.architecture)
    )
    error_message = "architecture must be one of: x86_64, arm64."
  }

}

variable "virtualization_type" {
  description = "AMI virtualization type"
  type        = string
  default     = null

  validation {
    condition = (
      var.virtualization_type == null || var.virtualization_type == "hvm"
    )
    error_message = "virtualization_type must be hvm."
  }

}

variable "root_device_type" {
  description = "AMI root device type"
  type        = string
  default     = null

  validation {
    condition = (
      var.root_device_type == null
      || contains(["ebs", "instance-store"], var.root_device_type)
    )
    error_message = "root_device_type must be ebs or instance-store."
  }

}






