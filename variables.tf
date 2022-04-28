variable "environment" {
  type    = string
  default = "dev"
}

variable "aws_region" {
  type = string
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

variable "container_name" {
  type        = string
  description = "Name of the container."
}

variable "tls_cert_arn" {
  type        = string
  description = "ARN of the TLS certificate to use."
}
