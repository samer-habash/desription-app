data "template_file" "user_data_script" {
  template = <<EOF
    #!/bin/bash
    sudo su
    yum update -y
    amazon-linux-extras install docker
    systemctl enable docker.service
    systemctl start docker.service
    usermod -a -G docker ec2-user
    yum install python3 python3-pip -y
    unlink /usr/bin/python
    ln -sf /usr/bin/python3 /usr/bin/python
    pip3 install docker
  EOF
}