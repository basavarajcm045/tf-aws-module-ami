#========== PRIMARY OUTPUTS (For EC2/ASG modules) ==========

output "ami_id" {
  description = "Selected AMI ID - Use this for EC2 instances"
  value       = local.selected_ami_id
}

output "ami_name" {
  description = "Selected AMI name"
  value       = local.selected_ami_name
}

output "ami_creation_date" {
  description = "Selected AMI creation date"
  value       = try(local.selected_ami.creation_date, null)
}

output "ami_architecture" {
  description = "Selected AMI architecture"
  value       = try(local.selected_ami.architecture, null)
}

output "ami_virtualization_type" {
  description = "Selected AMI virtualization type"
  value       = try(local.selected_ami.virtualization_type, null)
}

output "ami_root_device_type" {
  description = "Selected AMI root device type"
  value       = try(local.selected_ami.root_device_type, null)
}

output "ami_hypervisor" {
  description = "Selected AMI hypervisor type"
  value       = try(local.selected_ami.hypervisor, null)
}

output "ami_tags" {
  description = "Tags associated with the selected AMI"
  value       = try(local.selected_ami.tags, null)
  
}