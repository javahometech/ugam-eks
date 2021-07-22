data "aws_availability_zones" "azs" {
  state = "available"
}

resource "aws_instance" "main" {
    for_each = toset(data.aws_availability_zones.azs.names)
    ami = "ami-0dc2d3e4c0f9ebd18"
    instance_type = "t2.micro"
}

output "name" {
  value = [for k,v in aws_instance.main : v.id]
}