resource "aws_instance" "code-deploy" {

  ami = "ami-03caad32a158f72db"

  instance_type = "t2.micro"

  subnet_id = var.subnet_id

  iam_instance_profile = var.iam_role

  tags = {
    Name = var.ec2_tag_key
    App  = var.ec2_tag_value
  }
}