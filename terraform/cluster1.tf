
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

module "service-alpha" {
  source = "./service-alpha"

  cluster_id      = aws_ecs_cluster.cluster1.id
  cluster_subnets = module.vpc.private_subnets
  
  desired_count = 3
}

module "service-bravo" {
  source = "./service-bravo"

  cluster_id      = aws_ecs_cluster.cluster1.id
  cluster_subnets = module.vpc.private_subnets
  
  desired_count = 3
}

module "service-gamma" {
  source = "./service-gamma"

  cluster_id      = aws_ecs_cluster.cluster1.id
  cluster_subnets = module.vpc.private_subnets
  
  desired_count = 3
}

