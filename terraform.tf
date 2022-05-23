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
  default_tags {
    tags = {
      Environment = var.environment
      Project     = local.project
    }
  }
}
