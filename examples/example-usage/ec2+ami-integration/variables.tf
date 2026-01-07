
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
  default = {
    environment = "dev"
    team        = "platform"
    version     = "1.1.1"
  }
}

