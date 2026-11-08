output "ecs_execution_role" {
  value = aws_iam_role.ecs_execution_role.arn
}

output "ecs_task_role" {
  value = aws_iam_role.ecs_task_role.arn
}

output "alb_dns_name" {
  value = aws_lb.main.dns_name
}

output "aws_route53_record" {
  value = aws_route53_record.elb.name
}

output "aws_ecs_service_name" {
  value = aws_ecs_service.main.name
}
