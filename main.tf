resource "aws_s3_bucket" "ccf_terraform_state" {
  bucket = var.terraform_state_bucket
}

resource "aws_s3_bucket_versioning" "ccf_terraform_state_versioning" {
  bucket = aws_s3_bucket.ccf_terraform_state.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "ccf_terraform_state_encryption" {
  bucket = aws_s3_bucket.ccf_terraform_state.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}


resource "aws_security_group" "ccf_instance_sg" {
  name   = "ccf-instance-sg"
  vpc_id = module.vpc.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [module.vpc.vpc_cidr_block]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [module.vpc.vpc_cidr_block]
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

  ami           = var.ami_id
  instance_type = var.instance_type
  # key_name               = var.key_name
  monitoring             = true
  vpc_security_group_ids = [aws_security_group.ccf_instance_sg.id]
  subnet_id              = module.vpc.private_subnets[0]
  user_data              = file("install.sh")
  iam_instance_profile   = aws_iam_instance_profile.ccf_instance_profile.name

  tags = local.tags
}
