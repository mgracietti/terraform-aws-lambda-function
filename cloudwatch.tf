# locals {
#   app_name = "${var.project}-${var.environment}-${var.service}"  
# }

resource "aws_cloudwatch_log_group" "log_group" {
  for_each = var.cron_lambdas
  name     = "${local.app_name}-${each.value.lambda_name}-LogGroup"

  retention_in_days = 7

  lifecycle {
    prevent_destroy = false
  }

  # tags = {
  #   project = local.app_name
  # }
}

resource "aws_cloudwatch_event_rule" "event_rule" {
  for_each            = var.cron_lambdas
  name                = "${local.app_name}-${each.value.lambda_name}-event-rule"
  schedule_expression = "cron(${each.value.trigger_cron})"

  # tags = {
  #   project = local.app_name
  # }
}

resource "aws_cloudwatch_event_target" "event_target" {
  for_each = var.cron_lambdas
  rule     = aws_cloudwatch_event_rule.event_rule[each.key].name
  arn      = aws_lambda_function.lambda[each.key].arn
}