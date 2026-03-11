resource "aws_codedeploy_app" "app" {

  name = var.app_name

  compute_platform = "Server"
}

resource "aws_codedeploy_deployment_group" "group" {

  app_name = aws_codedeploy_app.app.name

  deployment_group_name = "${var.app_name}-group"

  service_role_arn = aws_iam_role.codedeploy.arn

  ec2_tag_filter {

    key = var.ec2_tag_key

    value = var.ec2_tag_value

    type = "KEY_AND_VALUE"
  }
}

resource "aws_iam_role" "codedeploy" {

  name = "codedeploy-role"

  assume_role_policy = jsonencode({

    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Principal = {
          Service = "codedeploy.amazonaws.com"
        }

        Action = "sts:AssumeRole"
      }
    ]
  })
}