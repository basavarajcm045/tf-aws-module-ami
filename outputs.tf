#========== PRIMARY OUTPUTS (For EC2/ASG modules) ==========

output "aws_region" {
  description = "AWS region where the AMI was looked up"
  value       = var.region
  
}

output "ami_id" {
  description = "Selected AMI ID - Use this for EC2 instances"
  value       = local.selected_ami_id
}

output "ami_name" {
  description = "Selected AMI name"
  value       = local.selected_ami_name
}

output "ami_owner_id" {
  description = "AMI owner account ID"
  value       = try(local.selected_ami.owner_id, null)
}

output "ami_description" {
  description = "Selected AMI description"
  value       = try(local.selected_ami.description, null)
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

output "ami_image_type" {
  description = "Selected AMI image type"
  value       = try(local.selected_ami.image_type, null)
}

output "ami_platform_details" {
  description = "Selected AMI platform details"
  value       = try(local.selected_ami.platform_details, null)
}

output "ami_root_device_name" {
  description = "Selected AMI root device name"
  value       = try(local.selected_ami.root_device_name, null)
}

output "ami_block_device_mappings" {
  description = "Selected AMI block device mappings"
  value       = try(local.selected_ami.block_device_mappings, null)
}

output "ami_tags" {
  description = "Tags associated with the selected AMI"
  value       = try(local.selected_ami.tags, null)
  
}
output "ami_encrypted" {
  description = "Indicates whether the selected AMI is encrypted"
  value       = try(local.selected_ami.encrypted, null)
} 

output "ami_volume_size" {
  description = "Size of the root volume of the selected AMI"
  value       = try(local.selected_ami.volume_size, null)
}

output "ami_volume_type" {
  description = "Type of the root volume of the selected AMI"
  value       = try(local.selected_ami.volume_type, null)
  
}

output "ami_volume_iops" {
  description = "IOPS of the root volume of the selected AMI"
  value       = try(local.selected_ami.volume_iops, null)
  
}

output "ami_volume_throughput" {
  description = "Throughput of the root volume of the selected AMI"
  value       = try(local.selected_ami.volume_throughput, null)     
  
}

output "ami_snapshot_id" {
  description = "Snapshot ID of the root volume of the selected AMI"
  value       = try(local.selected_ami.snapshot_id, null)
  
}

output "ami_usage_instructions" {
  description = "Usage instructions for the selected AMI"
  value       = try(local.selected_ami.usage_instructions, null)
  
}
/*
output "ami_selected_os_type" {
  description = "Operating system type of the selected AMI"
  value       = local.selected_os_type
  
}

output "ami_selected_os_version" {
  description = "Operating system version of the selected AMI"
  value       = local.selected_os_version
  
}*/
/*
output "ami_selected_architecture" {
  description = "Architecture of the selected AMI"
  value       = local.selected_architecture
  
} 

output "ami_selected_virtualization_type" {
  description = "Virtualization type of the selected AMI"
  value       = local.selected_virtualization_type
  
} 

output "ami_selected_root_device_type" {
  description = "Root device type of the selected AMI"
  value       = local.selected_root_device_type
  
} */

/*output "ami_selected_tag_filters" {
  description = "Tag filters used to select the AMI"
  value       = local.selected_tag_filters
  
}*/


#========== ADDITIONAL OUTPUTS ==========
/*
output "ami_virtualization_type_full" {
  description = "Full virtualization type of the selected AMI"
  value       = try(local.selected_ami.virtualization_type, null)
} 
output "ami_sriov_net_support" {
  description = "SR-IOV network support of the selected AMI"
  value       = try(local.selected_ami.sriov_net_support, null)
} 
output "ami_boot_mode" {
  description = "Boot mode of the selected AMI"
  value       = try(local.selected_ami.boot_mode, null)
} 
output "ami_image_owner_alias" {
  description = "Image owner alias of the selected AMI"
  value       = try(local.selected_ami.image_owner_alias, null)
} 
output "ami_usage_operation" {
  description = "Usage operation of the selected AMI"
  value       = try(local.selected_ami.usage_operation, null)
} 
output "ami_product_codes" {
  description = "Product codes associated with the selected AMI"
  value       = try(local.selected_ami.product_codes, null)
} 
output "ami_hibernation_supported" {
  description = "Indicates whether hibernation is supported for the selected AMI"
  value       = try(local.selected_ami.hibernation_supported, null)
} */
