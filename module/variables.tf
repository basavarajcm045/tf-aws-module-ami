#AMI module input variables

#========== OPERATING SYSTEM SELECTION ==========

variable "os_type" {
  description = "Operating system type"
  type        = string

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

variable "architecture" {
  description = "AMI architecture (x86_64 or arm64)"
  type        = string
  default     = null

}

variable "virtualization_type" {
  description = "AMI virtualization type"
  type        = string
  default     = null

}

variable "root_device_type" {
  description = "AMI root device type"
  type        = string
  default     = null

}






