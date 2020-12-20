module "profile-description-app" {
  source = "../../Resource_Build/EC2_build"
  region = "us-east-1"
  ami = "ami-04d29b6f966df1537"
  ec2_instance_name = "profile-description-app"
  ec2_instance_type = "t2.micro"
  ec2_tier_type = "profile.backend"
  app_port = "5000"
  ssh_app_port = "22"
  app_protocol = "TCP"
  ec2_monitoring = true
  ec2_user = "ec2-user"
  sg_name = "echo_service_app_sg"
  user_data_ec2 = base64encode(data.template_file.user_data_script.rendered)
  ec2_key_pair_name = "EC2-KeyPair-Description-app"
  public_key_file = "EC2-KeyPair-Description-app.pub"
  private_key_file = "EC2-KeyPair-Description-app.pem"
}

output "EC2_public_IP" {
  value = module.profile-description-app.EC2_public_ip
}
output "EC2_public_DNS" {
  value = module.profile-description-app.EC2_public_dns
}

