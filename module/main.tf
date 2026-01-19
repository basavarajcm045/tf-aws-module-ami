#========== CONDITIONAL AMI SELECTION ==========

# This module returns the appropriate AMI ID based on the filter.

locals {

  selected_ami_id = try(data.aws_ami.data[0].id, null)

  selected_ami_name = try(data.aws_ami.data[0].name, null)

  # Get complete AMI object for additional metadata
  selected_ami = try(data.aws_ami.data[0], null)

  /*
  selected_ami_id = length(data.aws_ami.data) > 0
    ? data.aws_ami.data[0].id
    : null
}*/

  /*selected_ami_id = try(
                          data.aws_ami.custom[0].id,
                          data.aws_ami.amazon[0].id
                      )*/

  # Determine which AMI to use based on os_type
  /*selected_ami_id = (
    var.os_type == "custom" ? data.aws_ami.data[0].id :
    null
  )*/

}

#========== VALIDATION ==========

# Ensure an AMI was found

resource "terraform_data" "ami_validation" {
  input = local.selected_ami_id

  lifecycle {
    precondition {
      condition     = local.selected_ami_id != null
      error_message = "No AMI found for ami_name_filter = ${var.ami_name_filter}"
    }
  }
}



#========== AMI METADATA COLLECTION ==========
/*
locals {
  # Collect comprehensive AMI metadata
  ami_metadata = {
    id                  = local.selected_ami_id
    name                = local.selected_ami_name
    owner_id            = try(local.selected_ami.owner_id, null)
    architecture        = try(local.selected_ami.architecture, null)
    virtualization_type = try(local.selected_ami.virtualization_type, null)
    root_device_type    = try(local.selected_ami.root_device_type, null)
    creation_date       = try(local.selected_ami.creation_date, null)
    description         = try(local.selected_ami.description, null)
    ena_support         = try(local.selected_ami.ena_support, null)
    sriov_net_support   = try(local.selected_ami.sriov_net_support, null)
    tags                = try(local.selected_ami.tags, {})
  }
}*/
