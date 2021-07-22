# resource "aws_launch_template" "main" {
#   name = "${var.app_name}_${terraform.workspace}"

#   # capacity_reservation_specification {
#   #   capacity_reservation_preference = "open"
#   # }

#   # cpu_options {
#   #   core_count       = 1
#   #   threads_per_core = 2
#   # }

#   # credit_specification {
#   #   cpu_credits = "standard"
#   # }

#   disable_api_termination = true

#   ebs_optimized = false

#   instance_type = "t3.medium"

#   key_name = aws_key_pair.eks_nodes.key_name

#   # metadata_options {
#   #   http_endpoint               = "enabled"
#   #   http_tokens                 = "required"
#   #   http_put_response_hop_limit = 2
#   # }

#   vpc_security_group_ids = [aws_security_group.eks_nodes_sg.id]

#   tag_specifications {
#     resource_type = "instance"

#     tags = {
#       Name = "EKSUgam"
#     }
#   }
# }