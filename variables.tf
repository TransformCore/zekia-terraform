variable "aws_region" {
  type        = string
  description = "Region of the AWS account."
  default     = "eu-west-2"
}

variable "environment" {
  type        = string
  description = "Project environment (dev, stage, prod)."
  default     = "dev"
}

variable "desired_count" {
  type        = number
  description = "Desired number of ECS tasks to run."
}

variable "container_cpu" {
  type        = number
  description = "Number of CPU units used by the task."
}

variable "container_memory" {
  type        = number
  description = "Amount (MiB) of memory used by the task."
}

variable "container_port" {
  type        = number
  description = "Port the container should run on."
}

variable "container_image" {
  type        = string
  description = "Name of the container image."
}

variable "container_image_tag" {
  type        = string
  description = "Version of the container image to use."
}

variable "container_envs" {
  type        = list(string)
  description = "Environment variables for the container."
  default     = [""]
}

variable "domain" {
  type        = string
  description = "Domain name of the project."
}

variable "nameservers" {
  type        = list(string)
  description = "A list of nameservers for the domain."
}
