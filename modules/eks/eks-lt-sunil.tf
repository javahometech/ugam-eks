locals {
  common_tags ={
      "Dummy" : "Dummy"
  }
}
resource "aws_launch_template" "main" {
  name_prefix            = "eks-launchtemplate-"
  description            = "Default Launch-Template"
  update_default_version = true

  block_device_mappings {
    device_name = "/dev/xvda"

    ebs {
      volume_size           = 50
      volume_type           = "gp2"
      delete_on_termination = true
    }
  }

  
  key_name        = aws_key_pair.eks_nodes.key_name
  monitoring {
    enabled = true
  }
  
  tag_specifications {
    resource_type = "instance"

    tags = "${merge(
      local.common_tags,
      {
        "component"   = "k8s-infra",
        "application" = "k8s",
        "Name"        = "instance A"
        "env"         = "stg"
        "kubernetes.io/cluster/m1e-stage-k8s" = "owned"
      }
    )}"
  }

# Supplying custom tags to EKS instances root volumes
  tag_specifications {
    resource_type = "volume"

    tags = "${merge(
      local.common_tags,
      {
        "component"   = "k8s-infra",
        "application" = "k8s",
        "Name"        = "instance A"
        "env"         = "stg"
      }
    )}"
  }

  # Tagging for LT itself
  tags = "${merge(
    local.common_tags,
    {
      "component"   = "k8s-infra",
      "application" = "k8s",
       "Name"        = "instance A"
      "env"         = "stg"
    }
  )}"

  lifecycle {
    create_before_destroy = true
  }
}