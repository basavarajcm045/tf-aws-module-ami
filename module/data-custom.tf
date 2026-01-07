data "aws_ami" "custom" {
  count = var.os_type == "custom" ? 1 : 0

  most_recent = var.most_recent
  owners      = var.ami_owners != null ? var.ami_owners : ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = var.ami_name_filter != null ? [var.ami_name_filter] : ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-${var.architecture}-server-*"]
  }

  filter {
    name   = "architecture"
    values = [var.architecture]
  }

  filter {
    name   = "virtualization-type"
    values = [var.virtualization_type]
  }

  filter {
    name   = "root-device-type"
    values = [var.root_device_type]
  }

  filter {
    name   = "state"
    values = ["available"]
  }

  # Optional: Filter by OS version tag
  /*dynamic "filter" {
    for_each = var.os_version != null ? [var.os_version] : []
    content {
      name   = "tag:Version"
      values = [filter.value]
    }
  }*/

  # Additional custom tag filters
  dynamic "filter" {
    for_each = var.ami_tag_filters
    content {
      name   = "tag:${filter.key}"
      values = [filter.value]
    }
  }
}
