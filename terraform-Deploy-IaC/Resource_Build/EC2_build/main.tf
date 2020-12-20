provider "aws" {
  region = var.region
}

resource "aws_instance" "ec2_description_app" {
  ami           = var.ami
  instance_type = var.ec2_instance_type
  key_name = var.ec2_key_pair_name
  monitoring = var.ec2_monitoring
  vpc_security_group_ids = [aws_security_group.echo_service_sg.id]
  user_data = join("", list(var.user_data_ec2))
  depends_on = [aws_key_pair.ec2_key]
  tags = {
    Name = var.ec2_instance_name
    tier = var.ec2_tier_type
  }
  connection {
    host = "self.public_ip"
    type = "ssh"
    private_key = tls_private_key.create_ssh_key.private_key_pem
    user = var.ec2_user
  }
  provisioner "local-exec" {
    command = "sleep 60; export ANSIBLE_HOST_KEY_CHECKING=False; ansible-playbook -u ${var.ec2_user} --extra-vars 'host=${aws_instance.ec2_description_app.public_dns},' -i ${aws_instance.ec2_description_app.public_dns}, --private-key $(pwd)/${var.private_key_file} ../../../ansible-roles/build_deploy_containers.yaml"
  }
}