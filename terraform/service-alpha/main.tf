
resource "aws_ecs_service" "service-alpha" {
  name            = "service-alpha"
  cluster         = var.cluster_id
  task_definition = aws_ecs_task_definition.service-alpha.arn
  desired_count   = var.desired_count

  network_configuration {
    subnets          = var.cluster_subnets
    assign_public_ip = true
  }
}

resource "aws_ecs_task_definition" "service-alpha" {
  family       = "service-alpha"
  network_mode = "awsvpc"
  cpu          = 256
  memory       = 512
  requires_compatibilities = ["FARGATE"]

  container_definitions = jsonencode([
    {
      name        = "nginx"
      image       = "nginx:1.20.1-alpine"
      essential   = true
    }
  ])
}

