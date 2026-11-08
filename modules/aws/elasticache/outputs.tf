output "arn" {
  value = var.cluster_mode ? aws_elasticache_replication_group.redis[*].arn : aws_elasticache_cluster.redis[*].arn
}

output "primary_endpoint" {
  value = var.cluster_mode ? aws_elasticache_replication_group.redis[*].primary_endpoint_address : aws_elasticache_cluster.redis[*].cache_nodes[*].address
}

output "secondary_endpoint" {
  value = var.cluster_mode ? aws_elasticache_replication_group.redis[*].reader_endpoint_address : []
}

output "ssm_parameter_url" {
  value = var.cluster_mode ? aws_ssm_parameter.redis_cluster_url[*].arn : aws_ssm_parameter.redis_url[*].arn
}
