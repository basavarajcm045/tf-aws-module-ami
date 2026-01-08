
variable "ami_owner" {
  description = "The AWS account ID of the AMI owner."
  type        = string

}
variable "ami_name_filter" {
  description = "The name filter pattern for the AMI."
  type        = string

}

variable "ami_tag_filters" {
  description = "A map of tag key-value pairs to filter the AMI."
  type        = map(string)

}

