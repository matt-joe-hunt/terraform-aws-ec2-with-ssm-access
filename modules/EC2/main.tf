resource "aws_instance" "ec2" {
  ami                         = var.ami_id == "null" ? data.aws_ssm_parameter.linuxAmi.value : var.ami_id
  instance_type               = var.instance_type == "null" ? "t2.micro" : var.instance_type
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.sg.id]
  subnet_id                   = tolist(data.aws_subnet_ids.default.ids)[0]
  iam_instance_profile        = aws_iam_instance_profile.ec2_iam_instance_profile.name
  tags = {
    Name = "${var.project}_instance"
    Environment = terraform.workspace
  }
}

## IAM

resource "aws_iam_role" "ec2_role" {
  name               = "${var.project}_role"
  description        = "The role for the ${var.project}_Instance"
  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": {
        "Effect": "Allow",
        "Principal": {"Service": "ec2.amazonaws.com"},
        "Action": "sts:AssumeRole"
    }
}
EOF
}

resource "aws_iam_role_policy_attachment" "ec2_ssm_policy" {
  role       = aws_iam_role.ec2_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_iam_instance_profile" "ec2_iam_instance_profile" {
  name = "${var.project}_profile"
  role = aws_iam_role.ec2_role.name
}

# SG

resource "aws_security_group" "sg" {
  name        = "${var.project}_security_group"
  description = "Allow access to port 443 from host machine and access to internet"
  vpc_id      = data.aws_vpc.default.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group_rule" "ingress_rule" {
  security_group_id = aws_security_group.sg.id
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  self = true
}