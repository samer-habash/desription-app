output "EC2_public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.ec2_description_app.public_ip
}
output "EC2_public_dns" {
  description = "Public DNS of the EC2 instance"
  value       = aws_instance.ec2_description_app.public_dns
}