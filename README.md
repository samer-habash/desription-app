# desription-app

Description App Project:

1. App Definition:

        - The app is a single html file that contains a candidate profile description.
        - The app is applied via terraform IaC with an ansible playbook with an extra EC2 user data bash script,
            I used both ansible and bash script in order to make things a more variety.
        - The app runs inside a docker container with a default port of 5000

2. App Usage:
    
        - To build the app , please go to dir infinidat-project/terraform-Deploy-IaC/Resource_Deploy/EC2_deploy,
            do terraform init , then terraform apply.

        
3. Steps building the app with some additional notes , in order to understand the layers in the app.
    
    a. The app exposes port 5000 by default, so to access the app, pleas surf to : https:public_ec2_dns:5000
    b. The project is building the initial setup via bash script and then apply the docker container via ansible.
    c. If any changes applied to the python flask code, then you should first tar the app with the below command:
        ~$ tar -cvf description-app.tar app.py templates/ static
        ~$ docker build + push to your docker repo.
    d. The ansible command that uses to automate with terraform uses "python3" interpreter with root privileges.
    e. SSH key will be generated inside the directory, and an aws key pair will be created.
    f. Last but not least when you would like to apply the app remove the sshkey.
    g. in terms of security the app opens ports 5000 and 22 to public world, and uses the default vpc.


