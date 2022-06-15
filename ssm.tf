# resource "aws_ssm_parameter" "params" {
#   name      = "${local.project}-envs-${var.environment}"
#   value     = ""
#   type      = "String"
#   tier      = "Standard"
#   overwrite = true
#   key_id    = module.paramstore_kms.key_id
# }

# data "aws_ssm_parameter" "fetched_params" {
#   name = aws_ssm_parameter.params.name
#   depends_on = [
#     aws_ssm_parameter.params
#   ]
# }
