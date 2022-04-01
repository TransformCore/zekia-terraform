resource "aws_security_group" "ccf_instance_sg" {
  name   = "ccf-instance-sg"
  vpc_id = module.vpc.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

resource "aws_iam_instance_profile" "ccf_instance_profile" {
  name = "ccf-instance-profile"
  role = aws_iam_role.ccf_api_role.name
}

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = aws_key_pair.ccf_ec2_key.key_name
  monitoring             = true
  vpc_security_group_ids = [aws_security_group.ccf_instance_sg.id]
  subnet_id              = module.vpc.public_subnets[0]
  user_data              = file("install.sh")
  iam_instance_profile   = aws_iam_instance_profile.ccf_instance_profile.name

  tags = local.tags
}

resource "aws_key_pair" "ccf_ec2_key" {
  key_name   = "ccf-ec2-key"
  public_key = var.ccf_ec2_key
}

resource "aws_network_interface" "nwif" {
  subnet_id       = module.vpc.public_subnets[0]
  security_groups = [aws_security_group.ccf_instance_sg.id]

  attachment {
    instance     = module.ec2_instance.id
    device_index = 1
  }
}
