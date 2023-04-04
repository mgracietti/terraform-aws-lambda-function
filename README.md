# terraform-aws-lambda-function
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 4.11.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.11.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_event_rule.event_rule](https://registry.terraform.io/providers/hashicorp/aws/4.11.0/docs/resources/cloudwatch_event_rule) | resource |
| [aws_cloudwatch_event_target.event_target](https://registry.terraform.io/providers/hashicorp/aws/4.11.0/docs/resources/cloudwatch_event_target) | resource |
| [aws_cloudwatch_log_group.log_group](https://registry.terraform.io/providers/hashicorp/aws/4.11.0/docs/resources/cloudwatch_log_group) | resource |
| [aws_lambda_function.lambda](https://registry.terraform.io/providers/hashicorp/aws/4.11.0/docs/resources/lambda_function) | resource |
| [aws_lambda_permission.allow_cloudwatch_to_lambda](https://registry.terraform.io/providers/hashicorp/aws/4.11.0/docs/resources/lambda_permission) | resource |
| [aws_iam_role.iam_role_for_lambdas](https://registry.terraform.io/providers/hashicorp/aws/4.11.0/docs/data-sources/iam_role) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | AWS Region | `string` | n/a | yes |
| <a name="input_cron_lambdas"></a> [cron\_lambdas](#input\_cron\_lambdas) | this variable will be used to create the cron lambdas | <pre>map(object({<br>    lambda_name  = string<br>    image_url    = string<br>    memory_size  = string<br>    timeout      = string<br>    trigger_cron = string<br>    handler      = string<br>  }))</pre> | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | Identify the environment in which the resource is being used, such as "dev", "qa", "test", "uat", "staging", or "prod". | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | The name of the project or application associated with the resource. | `string` | n/a | yes |
| <a name="input_service"></a> [service](#input\_service) | The service or application that the resource is related to. | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->