locals {
  project        = "Cloud Carbon Footprint"
  name           = "cloud-carbon-footprint"
  container_name = "${local.name}-container-${var.environment}"
}
