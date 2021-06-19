terraform {
  backend "remote" {
    organization = "myspotontheweb"

    workspaces {
      name = "ecs-workloads-1"
    }
  }
}

provider "aws" {
  region = "eu-west-1"
}
