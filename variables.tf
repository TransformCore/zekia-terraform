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
  default     = 1024
}

variable "container_memory" {
  type        = number
  description = "Amount (MiB) of memory used by the task."
  default     = 2048
}

variable "container_port" {
  type        = number
  description = "Port the container should run on."
  default     = 80
}

variable "container_envs" {
  type        = list(string)
  description = "Environment variables for the container."
  default     = [""]
}
