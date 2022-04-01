# internal-cloud-carbon-footprint-terraform

Cloud Carbon Footprint on AWS.
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.1.7 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 4.8.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.8.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ec2_instance"></a> [ec2\_instance](#module\_ec2\_instance) | terraform-aws-modules/ec2-instance/aws | ~> 3.0 |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | terraform-aws-modules/vpc/aws | 3.12.0 |

## Resources

| Name | Type |
|------|------|
| [aws_athena_database.athena_db](https://registry.terraform.io/providers/hashicorp/aws/4.8.0/docs/resources/athena_database) | resource |
| [aws_eip.ccf](https://registry.terraform.io/providers/hashicorp/aws/4.8.0/docs/resources/eip) | resource |
| [aws_iam_instance_profile.ccf_instance_profile](https://registry.terraform.io/providers/hashicorp/aws/4.8.0/docs/resources/iam_instance_profile) | resource |
| [aws_iam_policy.athena](https://registry.terraform.io/providers/hashicorp/aws/4.8.0/docs/resources/iam_policy) | resource |
| [aws_iam_policy.ce](https://registry.terraform.io/providers/hashicorp/aws/4.8.0/docs/resources/iam_policy) | resource |
| [aws_iam_policy.glue](https://registry.terraform.io/providers/hashicorp/aws/4.8.0/docs/resources/iam_policy) | resource |
| [aws_iam_policy.s3](https://registry.terraform.io/providers/hashicorp/aws/4.8.0/docs/resources/iam_policy) | resource |
| [aws_iam_role.ccf_api_role](https://registry.terraform.io/providers/hashicorp/aws/4.8.0/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.athena](https://registry.terraform.io/providers/hashicorp/aws/4.8.0/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.ce](https://registry.terraform.io/providers/hashicorp/aws/4.8.0/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.glue](https://registry.terraform.io/providers/hashicorp/aws/4.8.0/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.s3](https://registry.terraform.io/providers/hashicorp/aws/4.8.0/docs/resources/iam_role_policy_attachment) | resource |
| [aws_key_pair.ccf_ec2_key](https://registry.terraform.io/providers/hashicorp/aws/4.8.0/docs/resources/key_pair) | resource |
| [aws_network_interface.nwif](https://registry.terraform.io/providers/hashicorp/aws/4.8.0/docs/resources/network_interface) | resource |
| [aws_route.internet_access](https://registry.terraform.io/providers/hashicorp/aws/4.8.0/docs/resources/route) | resource |
| [aws_route_table.private](https://registry.terraform.io/providers/hashicorp/aws/4.8.0/docs/resources/route_table) | resource |
| [aws_s3_bucket.athena_query_results_bucket](https://registry.terraform.io/providers/hashicorp/aws/4.8.0/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket.ccf_terraform_state](https://registry.terraform.io/providers/hashicorp/aws/4.8.0/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_server_side_encryption_configuration.athena_bucket_encryption](https://registry.terraform.io/providers/hashicorp/aws/4.8.0/docs/resources/s3_bucket_server_side_encryption_configuration) | resource |
| [aws_s3_bucket_server_side_encryption_configuration.ccf_terraform_state_encryption](https://registry.terraform.io/providers/hashicorp/aws/4.8.0/docs/resources/s3_bucket_server_side_encryption_configuration) | resource |
| [aws_s3_bucket_versioning.athena_bucket_versioning](https://registry.terraform.io/providers/hashicorp/aws/4.8.0/docs/resources/s3_bucket_versioning) | resource |
| [aws_s3_bucket_versioning.ccf_terraform_state_versioning](https://registry.terraform.io/providers/hashicorp/aws/4.8.0/docs/resources/s3_bucket_versioning) | resource |
| [aws_security_group.ccf_instance_sg](https://registry.terraform.io/providers/hashicorp/aws/4.8.0/docs/resources/security_group) | resource |
| [aws_availability_zones.available](https://registry.terraform.io/providers/hashicorp/aws/4.8.0/docs/data-sources/availability_zones) | data source |
| [aws_iam_policy_document.assume_role_policy](https://registry.terraform.io/providers/hashicorp/aws/4.8.0/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.athena](https://registry.terraform.io/providers/hashicorp/aws/4.8.0/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.ce](https://registry.terraform.io/providers/hashicorp/aws/4.8.0/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.glue](https://registry.terraform.io/providers/hashicorp/aws/4.8.0/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.s3](https://registry.terraform.io/providers/hashicorp/aws/4.8.0/docs/data-sources/iam_policy_document) | data source |
| [aws_s3_bucket.billing_data_bucket](https://registry.terraform.io/providers/hashicorp/aws/4.8.0/docs/data-sources/s3_bucket) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ami_id"></a> [ami\_id](#input\_ami\_id) | n/a | `string` | `"ami-03e88be9ecff64781"` | no |
| <a name="input_application"></a> [application](#input\_application) | n/a | `string` | `"ccf"` | no |
| <a name="input_athena_query_results_bucket"></a> [athena\_query\_results\_bucket](#input\_athena\_query\_results\_bucket) | n/a | `string` | `"internal-cloud-carbon-footprint-athena-results"` | no |
| <a name="input_ccf_ec2_key"></a> [ccf\_ec2\_key](#input\_ccf\_ec2\_key) | Public key for EC2 instance. | `string` | n/a | yes |
| <a name="input_default_region"></a> [default\_region](#input\_default\_region) | n/a | `string` | `"eu-west-2"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | n/a | `string` | `"dev"` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | n/a | `string` | `"t2.medium"` | no |
| <a name="input_terraform_state_bucket"></a> [terraform\_state\_bucket](#input\_terraform\_state\_bucket) | n/a | `string` | `"internal-cloud-carbon-footprint-terraform-state"` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
