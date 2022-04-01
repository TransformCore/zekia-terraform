variable "terraform_state_bucket" {
  type    = string
  default = "internal-cloud-carbon-footprint-terraform-state"
}

variable "athena_query_results_bucket" {
  type    = string
  default = "internal-cloud-carbon-footprint-athena-results"
}

variable "default_region" {
  type    = string
  default = "eu-west-2"
}

variable "ami_id" {
  type    = string
  default = "ami-03e88be9ecff64781" # Amazon Linux AMI 2. This changes based on your AWS region.
}

variable "instance_type" {
  type    = string
  default = "t2.medium"
}

variable "application" {
  type    = string
  default = "ccf"
}

variable "environment" {
  type    = string
  default = "dev"
}

variable "ccf_ec2_key" {
  type        = string
  description = "Public key for EC2 instance."
  sensitive   = true
}
