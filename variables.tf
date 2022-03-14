data "aws_vpc" "default_vpc" {
  default = true
}

data "aws_subnets" "subnets" {
    filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default_vpc.id]
  }
  #vpc_id = data.aws_vpc.default_vpc.id
}

data "aws_security_group" "default-sg" {
  name = "default"
}