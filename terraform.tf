terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.8.0"
    }
  }

  backend "s3" {
    bucket = "internal-cloud-carbon-footprint-terraform-state"
    key    = "terraform.tfstate"
    region = "eu-west-2"
  }

  required_version = ">= 1.1.7"
}

provider "aws" {
  profile = "default"
  region  = var.default_region
}
