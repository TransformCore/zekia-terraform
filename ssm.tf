resource "aws_ssm_parameter" "params" {
  name      = "${local.project}-envs-${var.environment}"
  value     = join(",", [for i, v in local.parameters : "${i}=${v}"])
  type      = "StringList"
  tier      = "Standard"
  overwrite = false
  key_id    = module.paramstore_kms.key_id
}

data "aws_ssm_parameter" "fetched_params" {
  name = aws_ssm_parameter.params.name
  depends_on = [
    aws_ssm_parameter.params
  ]
}
