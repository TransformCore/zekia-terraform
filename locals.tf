locals {
  project        = "Cloud Carbon Footprint"
  name           = "cloud-carbon-footprint"
  db_name        = "cloud_carbon_footprint"
  container_name = "${local.name}-container-${var.environment}"
  s3_origin_id   = "s3OriginId"
}
