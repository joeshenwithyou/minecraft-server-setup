# minecraft-server-setup

Author: Josiah Potts
Date: 9 June 2024
Assignment: Course Project 2 - System Administration

## BACKGROUND
This reposity automates the creation of an EC2 instance with Ubuntu on AWS using Terraform, as well as utilizing shell scripting to set up, start, and stop the server.

## REQUIREMENTS
1. In the minecraft-server-setup directory run:
`dependencies.sh`
- This will install what we need for AWS and Terraform.

2. Now get your AWS credentials and copy/paste them into `~/.aws/credentials`

3. Generate a SSH key pair and put it into whatever directory you choose to put it, but save that key path.
Eg.`ssh-keygen -t rsa -b 4096 -C "name_of_key"`

4. Replace the key path within the `server.sh` file, and put the public key string in the variable in `terraform.tfvars`

5. Get your public IP address and put it in `terraform.tfvars`

## STEPS TO RUN
1. Terraform
- Run these commands:
`chmod +x setup.sh`
`./setup.sh`
- Type "yes" to the prompts, if applicable.
- This will cause Terraform to use `main.tf` to build the EC2 instance. Note the public IP address that prints out in the console, you will need it to connect.

2. Minecraft Server
- Run these commands:
`chmod +x server.sh`
`./server.sh`
- Type "yes" to the prompts.
- This will take a while, but once it is complete the server will be running successfully!

3. Connect to Server
- Open a new terminal and run this command:
`nmap -sV -Pn T:25565 <instance_public_ip>`
- This will give you the server state of "open".

4. Server Shutdown
- Run these commands:
`chmod +x shutdown-server.sh`
`./shutdown-server.sh`
- This will stop the EC2 instance.

### AUTHOR NOTES
The rebooting functionality worked in my first tutorial, but I was having a hard time getting it to work in this project.

### SOURCES
#### Source: ChatGPT 3.5 referenced on 6/9/24 for the following items:
- Terraform `main.tf` file
- Script `server.sh` file
- Script `shutdown-server.sh` file

##### Source: Minecraft.net referenced for the following items...
- Install Java and Minecraft (https://www.minecraft.net/en-us/download/server)

##### Source: Digital Ocean
- Install Java version (https://www.digitalocean.com/community/tutorials/how-to-install-java-with-apt-on-ubuntu-22-04)
