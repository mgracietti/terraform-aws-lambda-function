variable "aws_region" {
  type        = string
  description = "AWS Region"

  validation {
    condition     = can(regex("([A-Za-z0-9]+(-[A-Za-z0-9]+)+)", var.aws_region))
    error_message = "Verify you information and try again"
  }

}

variable "environment" {
  type        = string
  description = "Identify the environment in which the resource is being used, such as \"dev\", \"qa\", \"test\", \"uat\", \"staging\", or \"prod\"."

  validation {
    condition     = contains(["dev", "qa", "test", "uat", "staging", "prod"], var.environment)
    error_message = "The environment value must be \"dev\", \"qa\", \"test\", \"uat\", \"staging\", or \"prod\"."
  }
}


variable "project" {
  type        = string
  description = "The name of the project or application associated with the resource."

  validation {
    condition     = can(regex("([A-Za-z0-9]+(-[A-Za-z0-9]+)+)", var.project))
    error_message = "Verify you information and try again"
  }

}

variable "service" {
  type        = string
  description = "The service or application that the resource is related to."

  validation {
    condition     = can(regex("([A-Za-z0-9]+(-[A-Za-z0-9]+)+)", var.service))
    error_message = "Verify you information and try again"
  }

}


variable "cron_lambdas" {
  type = map(object({
    lambda_name  = string
    image_url    = string
    memory_size  = string
    timeout      = string
    trigger_cron = string
    handler      = string
  }))
  description = "this variable will be used to create the cron lambdas"

 default = {
    sync_sales_channels = {
      lambda_name = "sync-sales-channels"
      image_url = "521857530109.dkr.ecr.us-east-2.amazonaws.com/open-fields-prod-dremio-integration:latest"
      memory_size = 512
      timeout = 900
      trigger_cron = "0 23 * * ? *"
      handler = "index.salesChannelsSync"
    } 
  }

}