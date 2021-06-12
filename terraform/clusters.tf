
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

