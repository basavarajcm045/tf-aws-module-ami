#Core AMI data source logic

#========== CONDITIONAL AMI SELECTION ==========

# This module returns the appropriate AMI based on the operating system type
# Only ONE of these data sources will be used based on var.os_type

locals {

  selected_ami_id = try(data.aws_ami.data[0].id, null)

  /*selected_ami_id = try(
                          data.aws_ami.custom[0].id,
                          data.aws_ami.amazon[0].id
                      )*/

  # Determine which AMI to use based on os_type
  /*selected_ami_id = (
    var.os_type == "custom" ? data.aws_ami.data[0].id :
    null
  )*/

  selected_ami_name = try(data.aws_ami.data[0].name, null)

  /*selected_ami_name = (
    //var.os_type == "amazon-linux" ? data.aws_ami.data[0].name :
    //var.os_type == "windows" ? data.aws_ami.data[0].name :
    var.os_type == "custom" ? data.aws_ami.data[0].name :
    null
  )*/

  # Get complete AMI object for additional metadata

  selected_ami = try(data.aws_ami.data[0], null)
  /*selected_ami = (
    //var.os_type == "amazon-linux" ? data.aws_ami.data[0] :
    //var.os_type == "windows" ? data.aws_ami.data[0] :
    var.os_type == "custom" ? data.aws_ami.data[0] :
    null
  )*/
}

#========== VALIDATION ==========

# Ensure an AMI was found
resource "null_resource" "ami_validation" {
  count = local.selected_ami_id == null ? 1 : 0

  provisioner "local-exec" {
    command = "echo 'ERROR: No AMI found for os_type=${var.os_type}' && exit 1"
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
