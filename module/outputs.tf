
output "ami_id" {
  description = "Selected AMI ID - Use this for EC2 instances"
  value       = local.selected_ami_id

  precondition {
    condition = (
      var.os_type != "custom" || local.selected_ami_id != null
    )

    error_message = "No AMI found for ami_name_filter = ${var.ami_name_filter}"
  }

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

  precondition {
    condition = (
      var.architecture == null
      || local.selected_ami.architecture == var.architecture
    )

    error_message = "Selected AMI architecture does not match requested architecture."
  }
}

output "ami_virtualization_type" {
  description = "Selected AMI virtualization type"
  value       = try(local.selected_ami.virtualization_type, null)

  precondition {
    condition = (
      var.virtualization_type == null
      || local.selected_ami.virtualization_type == var.virtualization_type
    )

    error_message = "Selected AMI virtualization type does not match requested virtualization type."
  }
}

output "ami_root_device_type" {
  description = "Selected AMI root device type"
  value       = try(local.selected_ami.root_device_type, null)

  precondition {
    condition = (
      var.root_device_type == null
      || local.selected_ami.root_device_type == var.root_device_type
    )

    error_message = "Selected AMI root device type does not match requested root device type."
  }
}

output "ami_hypervisor" {
  description = "Selected AMI hypervisor type"
  value       = try(local.selected_ami.hypervisor, null)
}

output "ami_tags" {
  description = "Tags associated with the selected AMI"
  value       = try(local.selected_ami.tags, null)

}