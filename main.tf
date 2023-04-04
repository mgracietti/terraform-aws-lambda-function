locals {
  app_name = "${var.project}-${var.environment}-${var.service}"
}

data "aws_iam_role" "iam_role_for_lambdas" {
#   name = "${local.app_name}-IAM-role-for-lambdas"
  name = "cdp-IAM-role-for-lambdas"
}

resource "aws_lambda_function" "lambda" {
  for_each      = var.cron_lambdas
  function_name = "${local.app_name}-${each.value.lambda_name}-lambda"
  role          = data.aws_iam_role.iam_role_for_lambdas.arn
  package_type  = "Image"
  image_uri     = each.value.image_url
  memory_size   = each.value.memory_size
  timeout       = each.value.timeout

  image_config {
    command = [each.value.handler]
  }

  depends_on = [aws_cloudwatch_log_group.log_group]

  tags = {
    project = local.app_name
  }
}

resource "aws_lambda_permission" "allow_cloudwatch_to_lambda" {
  for_each      = var.cron_lambdas
  statement_id  = "AllowExecutionFromCloudWatch"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.lambda[each.key].function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.event_rule[each.key].arn
}
