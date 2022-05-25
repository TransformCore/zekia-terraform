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
  default     = 1
}

variable "container_cpu" {
  type        = number
  description = "Number of CPU units used by the task."
  default     = 512
}

variable "container_memory" {
  type        = number
  description = "Amount (MiB) of memory used by the task."
  default     = 1024
}

variable "container_port" {
  type        = number
  description = "Port the container should run on."
  default     = 8080
}

variable "container_image" {
  type        = string
  description = "Name of the container image."
}

variable "container_image_tag" {
  type        = string
  description = "Version of the container image to use."
  default     = "latest"
}

variable "container_envs" {
  type        = list(string)
  description = "Environment variables for the container."
  default     = [""]
}
