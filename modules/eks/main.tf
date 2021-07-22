resource "aws_eks_cluster" "main" {
  name     = "${var.app_name}-${terraform.workspace}"
  role_arn = aws_iam_role.main.arn

  vpc_config {
    subnet_ids = var.subnet_ids
  }

  depends_on = [
    aws_iam_role_policy_attachment.example-AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.example-AmazonEKSVPCResourceController,
  ]
}