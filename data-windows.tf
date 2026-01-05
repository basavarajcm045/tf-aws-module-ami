# Windows Server AMI data sources

#========== WINDOWS SERVER 2019 ==========

data "aws_ami" "windows" {
  count = var.os_type == "windows" ? 1 : 0

  most_recent = var.most_recent
  owners      = var.ami_owners != null ? var.ami_owners : ["801119661308"] # Amazon/Microsoft

  filter {
    name   = "name"
    values = var.ami_name_filter != null ? [var.ami_name_filter] : ["Windows_Server-2019-English-Full-Base-*"]
  }

  filter {
    name   = "platform"
    values = ["windows"]
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
  dynamic "filter" {
    for_each = var.os_version != null ? [var.os_version] : []
    content {
      name   = "tag:Version"
      values = [filter.value]
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
}
/*
#========== WINDOWS SERVER 2019 ==========

data "aws_ami" "windows_2019" {
  count = var.os_type == "windows-2019" ? 1 : 0

  most_recent = var.most_recent
  owners      = var.ami_owners != null ? var.ami_owners : ["801119661308"] # Amazon/Microsoft

  filter {
    name   = "name"
    values = var.ami_name_filter != null ? [var.ami_name_filter] : ["Windows_Server-2019-English-Full-Base-*"]
  }

  filter {
    name   = "platform"
    values = ["windows"]
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
  dynamic "filter" {
    for_each = var.os_version != null ? [var.os_version] : []
    content {
      name   = "tag:Version"
      values = [filter.value]
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
}

#========== WINDOWS SERVER 2022 ==========

data "aws_ami" "windows_2022" {
  count = var.os_type == "windows-2022" ? 1 : 0

  most_recent = var.most_recent
  owners      = var.ami_owners != null ? var.ami_owners : ["801119661308"] # Amazon/Microsoft

  filter {
    name   = "name"
    values = var.ami_name_filter != null ? [var.ami_name_filter] : ["Windows_Server-2022-English-Full-Base-*"]
  }

  filter {
    name   = "platform"
    values = ["windows"]
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
  dynamic "filter" {
    for_each = var.os_version != null ? [var.os_version] : []
    content {
      name   = "tag:Version"
      values = [filter.value]
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
}*/