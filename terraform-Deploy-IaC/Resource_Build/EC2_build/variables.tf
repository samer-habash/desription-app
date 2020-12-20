// EC2 Instance variable
variable "region" {}
variable "ami" {}
variable "ec2_instance_name" {}
variable "ec2_instance_type" {}
variable "ec2_monitoring" {
  type = bool
}
variable "ec2_tier_type" {}
variable "app_port" {}
variable "ssh_app_port" {}
variable "app_protocol" {}
variable "user_data_ec2" {}
variable "ec2_user" {}

// security group variables
variable "sg_name" {}

//Key Pair variables
variable "ec2_key_pair_name" {}
variable "public_key_file" {}
variable "private_key_file" {}