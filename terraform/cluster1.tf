
# =======
# Cluster
# =======

resource "aws_ecs_cluster" "cluster1" {
  name = "demo-cluster1"

  capacity_providers = ["FARGATE"]

  default_capacity_provider_strategy {
    capacity_provider = "FARGATE"
    weight = 100
  }

  setting {
    name  = "containerInsights"
    value = "disabled"
  }
}

# ========
# Services
# ========

resource "aws_ecs_service" "cluster1-service-alpha" {
  name            = "service-alpha"
  cluster         = aws_ecs_cluster.cluster1.id
  task_definition = aws_ecs_task_definition.cluster1-service-alpha.arn

  desired_count   = 2

  network_configuration {
    subnets          = module.vpc.private_subnets
    assign_public_ip = true
  }
}

resource "aws_ecs_service" "cluster1-service-beta" {
  name            = "service-beta"
  cluster         = aws_ecs_cluster.cluster1.id
  task_definition = aws_ecs_task_definition.cluster1-service-beta.arn

  desired_count   = 2

  network_configuration {
    subnets          = module.vpc.private_subnets
    assign_public_ip = true
  }
}

resource "aws_ecs_service" "cluster1-service-gamma" {
  name            = "service-gamma"
  cluster         = aws_ecs_cluster.cluster1.id
  task_definition = aws_ecs_task_definition.cluster1-service-gamma.arn

  desired_count   = 2

  network_configuration {
    subnets          = module.vpc.private_subnets
    assign_public_ip = true
  }
}

# ================
# Task definitions
# ================

resource "aws_ecs_task_definition" "cluster1-service-alpha" {
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

resource "aws_ecs_task_definition" "cluster1-service-beta" {
  family       = "service-beta"
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

resource "aws_ecs_task_definition" "cluster1-service-gamma" {
  family       = "service-gamma"
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

