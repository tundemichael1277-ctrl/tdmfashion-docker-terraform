
# =====================================
# ECS FARGATE SERVICE
# =====================================

resource "aws_ecs_service" "httpd" {
  name            = "httpd"
  cluster         = aws_ecs_cluster.website.id
  task_definition = aws_ecs_task_definition.httpd.arn
  launch_type     = "FARGATE"
  desired_count   = 1

  # Network Configuration
  network_configuration {
    subnets = [
      aws_subnet.public_1.id,
      aws_subnet.public_2.id
    ]

    security_groups  = [aws_security_group.ecs.id]
    assign_public_ip = true
  }

  # Load Balancer Configuration
  load_balancer {
    target_group_arn = aws_lb_target_group.httpd.arn
    container_name   = "httpd"
    container_port   = 80
  }

  depends_on = [
    aws_lb_listener.http
  ]
}

