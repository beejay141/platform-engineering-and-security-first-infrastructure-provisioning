output "rds_host" {
  description = "The host URI of the RDS instance"
  value       = aws_rds_cluster.aurora.endpoint
}

output "rds_username" {
  description = "The username of the RDS instance"
  value       = aws_rds_cluster.aurora.master_username
}

output "rds_password" {
  description = "The password of the RDS instance"
  value       = random_password.master_password.result
  sensitive   = true
}

output "security_group_id" {
  description = "The ID of the Security group associated to the RDS cluster"
  value       = aws_security_group.main.id
}
