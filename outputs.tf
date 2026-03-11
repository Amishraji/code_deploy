output "codedeploy_app_name" {
  value = module.codedeploy.app_name
}

output "deployment_group_name" {
  value = module.codedeploy.deployment_group_name
}

output "ec2_public_ip" {
  value = module.ec2.public_ip
}