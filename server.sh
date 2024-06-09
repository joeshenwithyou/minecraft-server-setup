#!/bin/bash
instance_ip=$(terraform output -raw instance_ip_addr)
ssh -i "path/to/your/private_key.pem" ubuntu@$instance_ip << 'EOF'
sudo apt update
sudo apt upgrade -y
sudo apt install -y openjdk-17-jre-headless
wget -O server.jar https://launcher.mojang.com/v1/objects/0b25178829b6c647a90c67d76751cf305d9a1bb7/server.jar
echo "eula=true" > eula.txt
nohup java -Xmx1024M -Xms1024M -jar server.jar nogui &
exit
EOF

echo "Minecraft server is now configured and running at: $instance_ip"
