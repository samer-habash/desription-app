resource "tls_private_key" "create_ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "null_resource" "download_private_key" {
  provisioner "local-exec" {
    command = "echo '${tls_private_key.create_ssh_key.private_key_pem}' > ${format("%s.pem", var.ec2_key_pair_name)} && chmod 0400 ${format("%s.pem", var.ec2_key_pair_name)}"
  }
}

resource "aws_key_pair" "ec2_key" {
  key_name = var.ec2_key_pair_name
  public_key = tls_private_key.create_ssh_key.public_key_openssh
}