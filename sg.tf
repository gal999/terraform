resource "aws_security_group" "servers-sg" {
  name   = "nginx-sg"
  vpc_id = data.aws_vpc.default_vpc.id
}

resource "aws_security_group_rule" "ingress-all" {
  security_group_id = aws_security_group.servers-sg.id
  from_port         = 0
  to_port           = 0
  protocol          = -1
  type              = "ingress"
  self              = true
}

resource "aws_security_group_rule" "egress-all" {
  from_port         = 0
  protocol          = "TCP"
  security_group_id = aws_security_group.servers-sg.id
  cidr_blocks       = ["0.0.0.0/0"]
  to_port           = 0
  type              = "egress"
}

resource "aws_security_group_rule" "ssh-external-to-node" {
  type = "ingress"
  security_group_id = aws_security_group.servers-sg.id
  from_port = 22
  to_port = 22
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "http-external-to-node" {
  type = "ingress"
  security_group_id = aws_security_group.servers-sg.id
  from_port = 80
  to_port = 80
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}