resource "aws_ecs_cluster" "website" {
  name = "website-cluster"

  configuration {
    execute_command_configuration {
      logging = "DEFAULT"
    }
  }
}

resource "aws_cloudwatch_log_group" "ecs" {
  name = "/ecs/httpd"
}
