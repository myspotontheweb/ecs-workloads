variable "desired_count" {
  description = "Number of containers to run"
  type        = number
  default     = 1
}

variable "cluster_id" {
  description = "The ECS cluster ID"
  type        = string
}

variable "cluster_subnets" {
  description = "The list of private subnets"
  type        = list(string)
}
