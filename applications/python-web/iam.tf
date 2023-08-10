
# ECS Execution Role for ECR to ECS communication
resource "aws_iam_role" "python_web_execution_role" {
  name = "python-web-execution-role-${var.env}"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
      }
    ]
  })
}
# Policy assigned to the ECS Execution Role
resource "aws_iam_policy" "python_web_execution_role_policy" {
  name = "python-web-execution-role-policy-${var.env}"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "AllowECRPullCWLogs"
        Effect = "Allow"
        Action = [
          "ecr:GetAuthorizationToken",
          "ecr:BatchCheckLayerAvailability",
          "ecr:GetDownloadUrlForLayer",
          "ecr:BatchGetImage",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ]
        Resource = "*"
      }
    ]
  })
}
# Attachment of ECS Execution Role with policy for role
resource "aws_iam_role_policy_attachment" "python_web_execution_role_policy_attachment" {
  policy_arn = aws_iam_policy.python_web_execution_role_policy.arn
  role       = aws_iam_role.python_web_execution_role.name
}

####

# Task Role for all things the container will need
resource "aws_iam_role" "python_web_task_role" {
  name = "python-web-task-role-${var.env}"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
      }
    ]
  })
}
# The policy for the Task Role.
resource "aws_iam_policy" "python_web_task_role_policy" {
  name = "python-web-task-role-policy-${var.env}"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
      "Effect" : "Allow",
      "Action" : ["*"],
      "Resource" : ["*"],
      }
    ]
  })
}
# Attaches the Task Policy to the Task role
resource "aws_iam_role_policy_attachment" "python_web_task_role_attachment" {
  policy_arn = aws_iam_policy.python_web_task_role_policy.arn
  role       = aws_iam_role.python_web_task_role.name
}
