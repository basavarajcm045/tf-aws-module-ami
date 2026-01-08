output "windows_ami_id" {
  value = module.ami_windows.ami_id
}

output "ami_name" {
  description = "Selected AMI name"
  value       = module.ami_windows.ami_name
}

output "ami_creation_date" {
  description = "Selected AMI creation date"
  value       = module.ami_windows.ami_creation_date
}

output "ami_architecture" {
  description = "Selected AMI architecture"
  value       = module.ami_windows.ami_architecture
}

output "ami_virtualization_type" {
  description = "Selected AMI virtualization type"
  value       = module.ami_windows.ami_virtualization_type
}

output "ami_root_device_type" {
  description = "Selected AMI root device type"
  value       = module.ami_windows.ami_root_device_type
}

output "ami_hypervisor" {
  description = "Selected AMI hypervisor type"
  value       = module.ami_windows.ami_hypervisor
}

output "ami_tags" {
  description = "Selected AMI tags"
  value       = module.ami_windows.ami_tags
}
