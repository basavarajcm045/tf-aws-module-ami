#Amazon Linux AMI data sources

data "aws_ami" "data" {
  count = var.os_type == "custom" ? 1 : 0

  most_recent = var.most_recent
  owners      = var.ami_owners != null ? var.ami_owners : ["137112412989"] # Amazon

  filter {
    name   = "name"
    values = [var.ami_name_filter]
  }

  filter {
    name   = "state"
    values = ["available"]
  }
  
  dynamic "filter" {
    for_each = var.architecture == null ? [] : [1]
    content {
      name   = "architecture"
      values = [var.architecture]
    }
  }

  dynamic "filter" {
  for_each = var.virtualization_type == null ? [] : [1]
  content {
    name   = "virtualization-type"
    values = [var.virtualization_type]
  }
}

  dynamic "filter" {
  for_each = var.root_device_type == null ? [] : [1]
  content {
    name   = "root-device-type"
    values = [var.root_device_type]
  }
}

  # Additional custom tag filters
  dynamic "filter" {
    for_each = var.ami_tag_filters
    content {
      name   = "tag:${filter.key}"
      values = [filter.value]
    }
  }

  # Optional: Filter by OS version tag
  /*dynamic "filter" {
    for_each = var.os_version != null ? [var.os_version] : []
    content {
      name   = "tag:version"
      values = [filter.value]
    }
  }*/
}
