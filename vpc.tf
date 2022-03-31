module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.12.0"

  name = "${var.application}-vpc"
  cidr = "10.0.0.0/16"

  azs             = data.aws_availability_zones.available
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true

  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Terraform   = "true"
    Environment = var.environment
  }
}

data "aws_availability_zones" "available" {}

resource "aws_route" "internet_access" {
  route_table_id         = module.vpc.vpc_main_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = module.vpc.igw_id
}

resource "aws_eip" "ccf" {
  instance = module.ec2_instance.id
  vpc      = true

  lifecycle {
    prevent_destroy = false
  }

  tags = {
    Name = "ccf-eip-${var.environment}"
  }
}

resource "aws_nat_gateway" "natgw" {
  subnet_id     = module.vpc.public_subnets[0]
  allocation_id = aws_eip.ccf.id
}

resource "aws_route_table" "private" {
  count  = length(data.aws_availability_zones.available.names)
  vpc_id = module.vpc.vpc_id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.natgw.id
  }
}
