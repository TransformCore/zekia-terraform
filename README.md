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
| <a name="module_kms"></a> [kms](#module\_kms) | git@github.com:TransformCore/internal-terraform-aws-kms.git | v0.0.1 |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | terraform-aws-modules/vpc/aws | 3.14.0 |

## Resources

| Name | Type |
|------|------|
| [aws_athena_database.main](https://registry.terraform.io/providers/hashicorp/aws/4.8.0/docs/resources/athena_database) | resource |
| [aws_cloudfront_distribution.s3_distribution](https://registry.terraform.io/providers/hashicorp/aws/4.8.0/docs/resources/cloudfront_distribution) | resource |
| [aws_cloudfront_origin_access_identity.main](https://registry.terraform.io/providers/hashicorp/aws/4.8.0/docs/resources/cloudfront_origin_access_identity) | resource |
| [aws_ecr_lifecycle_policy.main](https://registry.terraform.io/providers/hashicorp/aws/4.8.0/docs/resources/ecr_lifecycle_policy) | resource |
| [aws_ecr_repository.main](https://registry.terraform.io/providers/hashicorp/aws/4.8.0/docs/resources/ecr_repository) | resource |
| [aws_ecs_cluster.main](https://registry.terraform.io/providers/hashicorp/aws/4.8.0/docs/resources/ecs_cluster) | resource |
| [aws_ecs_cluster_capacity_providers.main](https://registry.terraform.io/providers/hashicorp/aws/4.8.0/docs/resources/ecs_cluster_capacity_providers) | resource |
| [aws_ecs_service.main](https://registry.terraform.io/providers/hashicorp/aws/4.8.0/docs/resources/ecs_service) | resource |
| [aws_ecs_task_definition.main](https://registry.terraform.io/providers/hashicorp/aws/4.8.0/docs/resources/ecs_task_definition) | resource |
| [aws_iam_policy.ecr_policy](https://registry.terraform.io/providers/hashicorp/aws/4.8.0/docs/resources/iam_policy) | resource |
| [aws_iam_role.ecs_task_execution_role](https://registry.terraform.io/providers/hashicorp/aws/4.8.0/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.ecs_task_execution_role](https://registry.terraform.io/providers/hashicorp/aws/4.8.0/docs/resources/iam_role_policy_attachment) | resource |
| [aws_lb.main](https://registry.terraform.io/providers/hashicorp/aws/4.8.0/docs/resources/lb) | resource |
| [aws_lb_listener.http](https://registry.terraform.io/providers/hashicorp/aws/4.8.0/docs/resources/lb_listener) | resource |
| [aws_lb_listener.https](https://registry.terraform.io/providers/hashicorp/aws/4.8.0/docs/resources/lb_listener) | resource |
| [aws_lb_target_group.main](https://registry.terraform.io/providers/hashicorp/aws/4.8.0/docs/resources/lb_target_group) | resource |
| [aws_route.internet_access](https://registry.terraform.io/providers/hashicorp/aws/4.8.0/docs/resources/route) | resource |
| [aws_route_table.private](https://registry.terraform.io/providers/hashicorp/aws/4.8.0/docs/resources/route_table) | resource |
| [aws_s3_bucket.athena](https://registry.terraform.io/providers/hashicorp/aws/4.8.0/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket.client](https://registry.terraform.io/providers/hashicorp/aws/4.8.0/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_acl.athena](https://registry.terraform.io/providers/hashicorp/aws/4.8.0/docs/resources/s3_bucket_acl) | resource |
| [aws_s3_bucket_acl.client](https://registry.terraform.io/providers/hashicorp/aws/4.8.0/docs/resources/s3_bucket_acl) | resource |
| [aws_s3_bucket_policy.client](https://registry.terraform.io/providers/hashicorp/aws/4.8.0/docs/resources/s3_bucket_policy) | resource |
| [aws_s3_bucket_public_access_block.athena](https://registry.terraform.io/providers/hashicorp/aws/4.8.0/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_s3_bucket_public_access_block.client](https://registry.terraform.io/providers/hashicorp/aws/4.8.0/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_s3_bucket_server_side_encryption_configuration.athena](https://registry.terraform.io/providers/hashicorp/aws/4.8.0/docs/resources/s3_bucket_server_side_encryption_configuration) | resource |
| [aws_s3_bucket_server_side_encryption_configuration.client](https://registry.terraform.io/providers/hashicorp/aws/4.8.0/docs/resources/s3_bucket_server_side_encryption_configuration) | resource |
| [aws_s3_bucket_versioning.athena](https://registry.terraform.io/providers/hashicorp/aws/4.8.0/docs/resources/s3_bucket_versioning) | resource |
| [aws_s3_bucket_versioning.client](https://registry.terraform.io/providers/hashicorp/aws/4.8.0/docs/resources/s3_bucket_versioning) | resource |
| [aws_s3_bucket_website_configuration.client](https://registry.terraform.io/providers/hashicorp/aws/4.8.0/docs/resources/s3_bucket_website_configuration) | resource |
| [aws_security_group.alb](https://registry.terraform.io/providers/hashicorp/aws/4.8.0/docs/resources/security_group) | resource |
| [aws_security_group.ecs_tasks](https://registry.terraform.io/providers/hashicorp/aws/4.8.0/docs/resources/security_group) | resource |
| [aws_availability_zones.available](https://registry.terraform.io/providers/hashicorp/aws/4.8.0/docs/data-sources/availability_zones) | data source |
| [aws_iam_policy_document.client](https://registry.terraform.io/providers/hashicorp/aws/4.8.0/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.ecr](https://registry.terraform.io/providers/hashicorp/aws/4.8.0/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.ecs_task_execution_role](https://registry.terraform.io/providers/hashicorp/aws/4.8.0/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | n/a | `string` | n/a | yes |
| <a name="input_container_cpu"></a> [container\_cpu](#input\_container\_cpu) | Number of CPU units used by the task. | `number` | n/a | yes |
| <a name="input_container_envs"></a> [container\_envs](#input\_container\_envs) | Environment variables for the container. | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| <a name="input_container_image"></a> [container\_image](#input\_container\_image) | Name of the container image. | `string` | n/a | yes |
| <a name="input_container_image_tag"></a> [container\_image\_tag](#input\_container\_image\_tag) | Version of the container image to use. | `string` | n/a | yes |
| <a name="input_container_memory"></a> [container\_memory](#input\_container\_memory) | Amount (MiB) of memory used by the task. | `number` | n/a | yes |
| <a name="input_container_port"></a> [container\_port](#input\_container\_port) | Port the container should run on. | `number` | n/a | yes |
| <a name="input_desired_count"></a> [desired\_count](#input\_desired\_count) | Desired number of ECS tasks to run. | `number` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | n/a | `string` | `"dev"` | no |
| <a name="input_tls_cert_arn"></a> [tls\_cert\_arn](#input\_tls\_cert\_arn) | ARN of the TLS certificate to use. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_alb_hostname"></a> [alb\_hostname](#output\_alb\_hostname) | URL of the ALB. |
| <a name="output_athena_results_bucket"></a> [athena\_results\_bucket](#output\_athena\_results\_bucket) | Name of the Athena bucket. |
| <a name="output_aws_ecr_repository_url"></a> [aws\_ecr\_repository\_url](#output\_aws\_ecr\_repository\_url) | n/a |
| <a name="output_cloudfront_domain_name"></a> [cloudfront\_domain\_name](#output\_cloudfront\_domain\_name) | URL of the CloudFront distribution. |
| <a name="output_static_files_bucket"></a> [static\_files\_bucket](#output\_static\_files\_bucket) | Name of the bucket for the static site files. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
