variable "aws_region" {
  type        = string
  description = "AWS Region"

  validation {
    condition = can(regex("([A-Za-z0-9]+(-[A-Za-z0-9]+)+)", var.aws_region))    
    error_message = "Verify you information and try again"
  }    
  
}

variable "environment" {
  type        = string
  description = "Identify the environment in which the resource is being used, such as \"dev\", \"qa\", \"test\", \"uat\", \"staging\", or \"prod\"."
  
  validation {
    condition = contains(["dev", "qa", "test", "uat", "staging", "prod"], var.environment)
    error_message = "The environment value must be \"dev\", \"qa\", \"test\", \"uat\", \"staging\", or \"prod\"."
  }    
}


variable "project" {
  type        = string
  description = "The name of the project or application associated with the resource."

  validation {
    condition = can(regex("([A-Za-z0-9]+(-[A-Za-z0-9]+)+)", var.project))    
    error_message = "Verify you information and try again"
  }    
  
}

variable "service" {
  type        = string
  description = "The service or application that the resource is related to."

  validation {
    condition = can(regex("([A-Za-z0-9]+(-[A-Za-z0-9]+)+)", var.service))    
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
}