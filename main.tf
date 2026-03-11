
module "s3" {

  source = "./modules/s3"

  bucket_name = var.bucket_name
}

module "iam" {

  source = "./modules/iam"
}

module "ec2" {

  source = "./modules/ec2"

  subnet_id = var.subnet_id

  iam_role    = module.iam.ec2_role_name
  ec2_tag_key = var.ec2_tag_key

  ec2_tag_value = var.ec2_tag_value
}


module "codedeploy" {

  source = "./modules/codedeploy"

  app_name = var.app_name

  ec2_tag_key = var.ec2_tag_key

  ec2_tag_value = var.ec2_tag_value
}