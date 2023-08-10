resource "aws_ecs_cluster" "python_web" {
  name = "python-web-clust-${var.env}"
  tags = local.default_tags
}

resource "aws_ecs_task_definition" "python_web" {
  family = "python-web-task-${var.env}"
  
  container_definitions = jsonencode([{
    "name" : "python-web",
    "image" : "${local.ecr_repository_url}:python-web",
    "ephemeral_storage": {
      "size_in_gib": 10
    }
    # Logs disabled for inital build out
    #"logConfiguration" : {
    #  "logDriver" : "awslogs",
    #  "options" : {
    #    "awslogs-group" : aws_cloudwatch_log_group.python_web_logs.name,
    #    "awslogs-region" : var.aws_region,
    #    "awslogs-stream-prefix" : "python-web-${var.env}"
    #  }
    #},
    "environment" : [
      {
        "name" : "Variable",
        "value" : "important"
      },
      {
        "name" : "Variable2"
        "value" : "important2"
      }
    ],
    "cpu" : 256,
    "memory" : 512,
    "essential" : true,
    "interactive" : false,
  }])

  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"

  cpu    = "256"
  memory = "512"

  execution_role_arn = aws_iam_role.python_web_execution_role.arn
  task_role_arn      = aws_iam_role.python_web_task_role.arn

  tags = local.default_tags
}

resource "aws_ecs_service" "python_web" {
  name                   = "python-web-service-${var.env}"
  cluster                = aws_ecs_cluster.python_web.id
  task_definition        = aws_ecs_task_definition.python_web.arn
  launch_type            = "FARGATE"
  desired_count          = 0
  enable_execute_command = true


  network_configuration {
    subnets = local.private_subnet_ids
    security_groups  = [aws_security_group.python_web.id]
    assign_public_ip = false
  }
}