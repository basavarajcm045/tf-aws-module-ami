
output "amazon_linux_ami_id" {
  value = module.ami_amazon_linux.ami_id
}

output "ami_name" {
  description = "Selected AMI name"
  value       = module.ami_amazon_linux.ami_name
}

output "ami_creation_date" {
  description = "Selected AMI creation date"
  value       = module.ami_amazon_linux.ami_creation_date
}

output "ami_hypervisor" {
  description = "Selected AMI hypervisor type"
  value       = module.ami_amazon_linux.ami_hypervisor
}

output "ami_tags" {
  description = "Selected AMI tags"
  value       = module.ami_amazon_linux.ami_tags
}
