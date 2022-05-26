terraform {
  required_version = ">= 1.1.7"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.15.1"
    }
  }

  backend "s3" {
    bucket = "zekia-terraform-state"
    key    = "terraform.tfstate"
    region = "eu-west-2"
  }
}

provider "aws" {
  region = var.aws_region
  default_tags {
    tags = {
      Environment = var.environment
      Project     = local.project
    }
  }
}

provider "aws" {
  alias  = "cloudfront"
  region = "us-east-1"

  default_tags {
    tags = {
      Environment = var.environment
      Project     = local.project
    }
  }
}

data "aws_s3_bucket" "state" {
  bucket = "zekia-terraform-state"
}
