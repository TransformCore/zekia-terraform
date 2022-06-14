data "aws_iam_account_alias" "current" {}

resource "aws_ssm_parameter" "params" {
  for_each  = local.parameters
  name      = each.key
  value     = each.value
  type      = "String"
  tier      = "Standard"
  overwrite = false
  key_id    = module.paramstore_kms.key_id
}
