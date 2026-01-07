#========== PRIMARY OUTPUTS (For EC2/ASG modules) ==========

output "aws_region" {
  description = "AWS region where the AMI was looked up"
  value       = module.ami_amazon_linux.aws_region

}

output "amazon_linux_ami_id" {
  value = module.ami_amazon_linux.ami_id
}

output "windows_ami_id" {
  value = module.ami_windows.ami_id
}

/*output "ami_id" {
  description = "Selected AMI ID - Use this for EC2 instances"
  value       = module.ami_amazon_linux.ami_id
}*/

output "ami_name" {
  description = "Selected AMI name"
  value       = module.ami_amazon_linux.ami_name
}

output "ami_owner_id" {
  description = "AMI owner account ID"
  value       = module.ami_amazon_linux.ami_owner_id
}

output "ami_description" {
  description = "Selected AMI description"
  value       = module.ami_amazon_linux.ami_description
}

output "ami_creation_date" {
  description = "Selected AMI creation date"
  value       = module.ami_amazon_linux.ami_creation_date
}

output "ami_architecture" {
  description = "Selected AMI architecture"
  value       = module.ami_amazon_linux.ami_architecture
}

output "ami_virtualization_type" {
  description = "Selected AMI virtualization type"
  value       = module.ami_amazon_linux.ami_virtualization_type
}

output "ami_root_device_type" {
  description = "Selected AMI root device type"
  value       = module.ami_amazon_linux.ami_root_device_type
}

output "ami_hypervisor" {
  description = "Selected AMI hypervisor type"
  value       = module.ami_amazon_linux.ami_hypervisor
}

output "ami_image_type" {
  description = "Selected AMI image type"
  value       = module.ami_amazon_linux.ami_image_type
}

output "ami_platform_details" {
  description = "Selected AMI platform details"
  value       = module.ami_amazon_linux.ami_platform_details
}

output "ami_root_device_name" {
  description = "Selected AMI root device name"
  value       = module.ami_amazon_linux.ami_root_device_name
}

output "ami_block_device_mappings" {
  description = "Selected AMI block device mappings"
  value       = module.ami_amazon_linux.ami_block_device_mappings
}

output "ami_tags" {
  description = "Selected AMI tags"
  value       = module.ami_amazon_linux.ami_tags
}

output "ami_encrypted" {
  description = "Whether the selected AMI's root volume is encrypted"
  value       = module.ami_amazon_linux.ami_encrypted
}

output "ami_volume_size" {
  description = "Size of the selected AMI's root volume in GiB"
  value       = module.ami_amazon_linux.ami_volume_size
}

output "ami_volume_type" {
  description = "Type of the selected AMI's root volume"
  value       = module.ami_amazon_linux.ami_volume_type
}

output "ami_volume_iops" {
  description = "IOPS of the selected AMI's root volume (if applicable)"
  value       = module.ami_amazon_linux.ami_volume_iops
}

output "ami_volume_throughput" {
  description = "Throughput of the selected AMI's root volume (if applicable)"
  value       = module.ami_amazon_linux.ami_volume_throughput
}

output "ami_snapshot_id" {
  description = "Snapshot ID of the selected AMI's root volume"
  value       = module.ami_amazon_linux.ami_snapshot_id
}

output "ami_usage_instructions" {
  description = "Usage instructions for the selected AMI"
  value       = module.ami_amazon_linux.ami_usage_instructions
}

//========== INPUT SUMMARY OUTPUTS ==========

/*output "ami_selected_os_type" {
  description = "The OS type used to select the AMI"
  value       = module.ami_amazon_linux.selected_os_type
}
output "ami_selected_os_version" {
  description = "The OS version used to select the AMI (if applicable)"
  value       = module.ami_amazon_linux.selected_os_version
}*/
/*
output "ami_selected_architecture" {
  description = "The architecture used to select the AMI"
  value       = module.ami_amazon_linux.selected_architecture
}
output "ami_selected_virtualization_type" {
  description = "The virtualization type used to select the AMI"
  value       = module.ami_amazon_linux.selected_virtualization_type
}
output "ami_selected_root_device_type" {
  description = "The root device type used to select the AMI"
  value       = module.ami_amazon_linux.selected_root_device_type
}*/

/*output "ami_selected_tag_filters" {
  description = "The tag filters used to select the AMI"
  value       = module.ami_amazon_linux.selected_tag_filters
}*/

/*owners      = var.ami_owners != null ? var.ami_owners : ["125523088429"] # Amazon

  filter {
    name   = "name"
    values = var.ami_name_filter != null ? [var.ami_name_filter] : ["amzn2-ami-hvm-*-${var.architecture}-gp2"]    
  }

  filter {
    name   = "architecture"
    values = [var.architecture]
  }*/