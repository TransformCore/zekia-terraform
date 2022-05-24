# internal-cloud-carbon-footprint-terraform

The Terraform for the zekia.io infrastructure. This deploys the following to AWS:

- An S3 bucket for static website files
- An Athena database to query CUR data
- A CloudFront distribution, pointed at the static website files bucket
- An ECS service to run container(s)
- An ECR repository for the container images
- A VPC including security groups
- An ACM certificate and Route53 configuration for a supplied domain

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.1.7 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 4.15.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.15.1 |
| <a name="provider_aws.cloudfront"></a> [aws.cloudfront](#provider\_aws.cloudfront) | 4.15.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_athena_kms"></a> [athena\_kms](#module\_athena\_kms) | git@github.com:TransformCore/internal-terraform-aws-kms.git | v0.0.1 |
| <a name="module_ecr_kms"></a> [ecr\_kms](#module\_ecr\_kms) | git@github.com:TransformCore/internal-terraform-aws-kms.git | v0.0.1 |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | terraform-aws-modules/vpc/aws | 3.14.0 |

## Resources

| Name | Type |
|------|------|
| [aws_acm_certificate.lb](https://registry.terraform.io/providers/hashicorp/aws/4.15.1/docs/resources/acm_certificate) | resource |
| [aws_acm_certificate.main](https://registry.terraform.io/providers/hashicorp/aws/4.15.1/docs/resources/acm_certificate) | resource |
| [aws_acm_certificate_validation.lb](https://registry.terraform.io/providers/hashicorp/aws/4.15.1/docs/resources/acm_certificate_validation) | resource |
| [aws_acm_certificate_validation.main](https://registry.terraform.io/providers/hashicorp/aws/4.15.1/docs/resources/acm_certificate_validation) | resource |
| [aws_athena_database.main](https://registry.terraform.io/providers/hashicorp/aws/4.15.1/docs/resources/athena_database) | resource |
| [aws_cloudfront_distribution.s3_distribution](https://registry.terraform.io/providers/hashicorp/aws/4.15.1/docs/resources/cloudfront_distribution) | resource |
| [aws_cloudfront_origin_access_identity.main](https://registry.terraform.io/providers/hashicorp/aws/4.15.1/docs/resources/cloudfront_origin_access_identity) | resource |
| [aws_ecr_lifecycle_policy.main](https://registry.terraform.io/providers/hashicorp/aws/4.15.1/docs/resources/ecr_lifecycle_policy) | resource |
| [aws_ecr_repository.main](https://registry.terraform.io/providers/hashicorp/aws/4.15.1/docs/resources/ecr_repository) | resource |
| [aws_ecs_cluster.main](https://registry.terraform.io/providers/hashicorp/aws/4.15.1/docs/resources/ecs_cluster) | resource |
| [aws_ecs_cluster_capacity_providers.main](https://registry.terraform.io/providers/hashicorp/aws/4.15.1/docs/resources/ecs_cluster_capacity_providers) | resource |
| [aws_ecs_service.main](https://registry.terraform.io/providers/hashicorp/aws/4.15.1/docs/resources/ecs_service) | resource |
| [aws_ecs_task_definition.main](https://registry.terraform.io/providers/hashicorp/aws/4.15.1/docs/resources/ecs_task_definition) | resource |
| [aws_iam_policy.ecr_policy](https://registry.terraform.io/providers/hashicorp/aws/4.15.1/docs/resources/iam_policy) | resource |
| [aws_iam_policy.s3_policy](https://registry.terraform.io/providers/hashicorp/aws/4.15.1/docs/resources/iam_policy) | resource |
| [aws_iam_role.assume_role](https://registry.terraform.io/providers/hashicorp/aws/4.15.1/docs/resources/iam_role) | resource |
| [aws_iam_role.ecs_task_execution_role](https://registry.terraform.io/providers/hashicorp/aws/4.15.1/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.assume_role_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/4.15.1/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.ecs_task_execution_role](https://registry.terraform.io/providers/hashicorp/aws/4.15.1/docs/resources/iam_role_policy_attachment) | resource |
| [aws_lb.main](https://registry.terraform.io/providers/hashicorp/aws/4.15.1/docs/resources/lb) | resource |
| [aws_lb_listener.http](https://registry.terraform.io/providers/hashicorp/aws/4.15.1/docs/resources/lb_listener) | resource |
| [aws_lb_listener.https](https://registry.terraform.io/providers/hashicorp/aws/4.15.1/docs/resources/lb_listener) | resource |
| [aws_lb_target_group.main](https://registry.terraform.io/providers/hashicorp/aws/4.15.1/docs/resources/lb_target_group) | resource |
| [aws_route.internet_access](https://registry.terraform.io/providers/hashicorp/aws/4.15.1/docs/resources/route) | resource |
| [aws_route53_record.api](https://registry.terraform.io/providers/hashicorp/aws/4.15.1/docs/resources/route53_record) | resource |
| [aws_route53_record.main](https://registry.terraform.io/providers/hashicorp/aws/4.15.1/docs/resources/route53_record) | resource |
| [aws_route53_record.validation](https://registry.terraform.io/providers/hashicorp/aws/4.15.1/docs/resources/route53_record) | resource |
| [aws_route53_zone.api](https://registry.terraform.io/providers/hashicorp/aws/4.15.1/docs/resources/route53_zone) | resource |
| [aws_route53domains_registered_domain.main](https://registry.terraform.io/providers/hashicorp/aws/4.15.1/docs/resources/route53domains_registered_domain) | resource |
| [aws_route_table.private](https://registry.terraform.io/providers/hashicorp/aws/4.15.1/docs/resources/route_table) | resource |
| [aws_s3_bucket.athena](https://registry.terraform.io/providers/hashicorp/aws/4.15.1/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket.client](https://registry.terraform.io/providers/hashicorp/aws/4.15.1/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_acl.athena](https://registry.terraform.io/providers/hashicorp/aws/4.15.1/docs/resources/s3_bucket_acl) | resource |
| [aws_s3_bucket_acl.client](https://registry.terraform.io/providers/hashicorp/aws/4.15.1/docs/resources/s3_bucket_acl) | resource |
| [aws_s3_bucket_policy.client](https://registry.terraform.io/providers/hashicorp/aws/4.15.1/docs/resources/s3_bucket_policy) | resource |
| [aws_s3_bucket_public_access_block.athena](https://registry.terraform.io/providers/hashicorp/aws/4.15.1/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_s3_bucket_public_access_block.client](https://registry.terraform.io/providers/hashicorp/aws/4.15.1/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_s3_bucket_server_side_encryption_configuration.athena](https://registry.terraform.io/providers/hashicorp/aws/4.15.1/docs/resources/s3_bucket_server_side_encryption_configuration) | resource |
| [aws_s3_bucket_server_side_encryption_configuration.client](https://registry.terraform.io/providers/hashicorp/aws/4.15.1/docs/resources/s3_bucket_server_side_encryption_configuration) | resource |
| [aws_s3_bucket_versioning.athena](https://registry.terraform.io/providers/hashicorp/aws/4.15.1/docs/resources/s3_bucket_versioning) | resource |
| [aws_s3_bucket_versioning.client](https://registry.terraform.io/providers/hashicorp/aws/4.15.1/docs/resources/s3_bucket_versioning) | resource |
| [aws_s3_bucket_website_configuration.client](https://registry.terraform.io/providers/hashicorp/aws/4.15.1/docs/resources/s3_bucket_website_configuration) | resource |
| [aws_security_group.alb](https://registry.terraform.io/providers/hashicorp/aws/4.15.1/docs/resources/security_group) | resource |
| [aws_security_group.ecs_tasks](https://registry.terraform.io/providers/hashicorp/aws/4.15.1/docs/resources/security_group) | resource |
| [aws_availability_zones.available](https://registry.terraform.io/providers/hashicorp/aws/4.15.1/docs/data-sources/availability_zones) | data source |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/4.15.1/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.assume_role_policy](https://registry.terraform.io/providers/hashicorp/aws/4.15.1/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.client](https://registry.terraform.io/providers/hashicorp/aws/4.15.1/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.ecr](https://registry.terraform.io/providers/hashicorp/aws/4.15.1/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.ecs_task_execution_role](https://registry.terraform.io/providers/hashicorp/aws/4.15.1/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.s3](https://registry.terraform.io/providers/hashicorp/aws/4.15.1/docs/data-sources/iam_policy_document) | data source |
| [aws_route53_zone.main](https://registry.terraform.io/providers/hashicorp/aws/4.15.1/docs/data-sources/route53_zone) | data source |
| [aws_s3_bucket.state](https://registry.terraform.io/providers/hashicorp/aws/4.15.1/docs/data-sources/s3_bucket) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | Region of the AWS account. | `string` | `"eu-west-2"` | no |
| <a name="input_container_cpu"></a> [container\_cpu](#input\_container\_cpu) | Number of CPU units used by the task. | `number` | n/a | yes |
| <a name="input_container_envs"></a> [container\_envs](#input\_container\_envs) | Environment variables for the container. | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| <a name="input_container_image"></a> [container\_image](#input\_container\_image) | Name of the container image. | `string` | n/a | yes |
| <a name="input_container_image_tag"></a> [container\_image\_tag](#input\_container\_image\_tag) | Version of the container image to use. | `string` | n/a | yes |
| <a name="input_container_memory"></a> [container\_memory](#input\_container\_memory) | Amount (MiB) of memory used by the task. | `number` | n/a | yes |
| <a name="input_container_port"></a> [container\_port](#input\_container\_port) | Port the container should run on. | `number` | n/a | yes |
| <a name="input_desired_count"></a> [desired\_count](#input\_desired\_count) | Desired number of ECS tasks to run. | `number` | n/a | yes |
| <a name="input_domain"></a> [domain](#input\_domain) | Domain name of the project. | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | Project environment (dev, stage, prod). | `string` | `"dev"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_alb_hostname"></a> [alb\_hostname](#output\_alb\_hostname) | URL of the ALB. |
| <a name="output_athena_results_bucket"></a> [athena\_results\_bucket](#output\_athena\_results\_bucket) | Name of the Athena bucket. |
| <a name="output_aws_ecr_repository_url"></a> [aws\_ecr\_repository\_url](#output\_aws\_ecr\_repository\_url) | URL of the ECR repository. |
| <a name="output_cloudfront_domain_name"></a> [cloudfront\_domain\_name](#output\_cloudfront\_domain\_name) | URL of the CloudFront distribution. |
| <a name="output_static_files_bucket"></a> [static\_files\_bucket](#output\_static\_files\_bucket) | Name of the bucket for the static site files. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
