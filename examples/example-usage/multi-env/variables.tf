
variable "os_type" {
  description = "The operating system type for the AMI (e.g., 'amazon-linux', 'ubuntu', 'rhel', 'centos', 'windows')."
  type        = string
  default     = "custom"
  
}

variable "ami_owner" { 
  description = "The AWS account ID of the AMI owner."
  type        = string
  default     = "533267218601" 
  
}
variable "ami_name_filter" {
  description = "The name filter pattern for the AMI."
  type        = string
  default     = "amzn-demo"
  
} 

variable "ami_tag_filters" {
  description = "A map of tag key-value pairs to filter the AMI."
  type        = map(string)
  default     = {
    environment = "dev"
    team        = "platform"
    version     = "1.1.1"
  }
}

variable "architecture" {
  description = "The architecture of the AMI (e.g., 'x86_64' or 'arm64')."
  type        = string
  default     = "x86_64"

}

variable "virtualization_type" {
  description = "The virtualization type of the AMI (e.g., 'hvm' or 'paravirtual')."
  type        = string
  default     = "hvm"
}

variable "root_device_type" {
  description = "The root device type of the AMI (e.g., 'ebs' or 'instance-store')."
  type        = string
  default     = "ebs"
} 

