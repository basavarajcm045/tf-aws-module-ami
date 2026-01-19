
variable "ami_owner" {
  description = "The AWS account ID of the AMI owner."
  type        = string

}

variable "ami_name_filter" {
  description = "The name filter pattern for the AMI."
  type        = string

}

variable "ubuntu_ami_name_filter" {
  description = "The name filter pattern for the ubuntu AMI."
  type        = string

}

variable "ami_tag_filters" {
  description = "A map of tag key-value pairs to filter the AMI."
  type        = map(string)

}

variable "ubuntu_ami_tag_filters" {
  description = "A map of tag key-value pairs to filter the AMI."
  type        = map(string)
  
}

variable "architecture" {
  description = "The architecture of the AMI (e.g., 'x86_64' or 'arm64')."
  type        = string

}

variable "ubuntu_architecture" {
  description = "The architecture of the AMI (e.g., 'x86_64' or 'arm64')."
  type        = string

}

variable "virtualization_type" {
  description = "The virtualization type of the AMI (e.g., 'hvm' or 'paravirtual')."
  type        = string
  default     = ""
}

variable "ubuntu_virtualization_type" {
  description = "The virtualization type of the AMI (e.g., 'hvm' or 'paravirtual')."
  type        = string
  default     = ""
}

variable "root_device_type" {
  description = "The root device type of the AMI (e.g., 'ebs' or 'instance-store')."
  type        = string
  default     = ""
}

variable "ubuntu_root_device_type" {
  description = "The root device type of the AMI (e.g., 'ebs' or 'instance-store')."
  type        = string
  default     = ""
}

