#1. SSH Pair (This uploads your public key to the AWS region)
resource "aws_key_pair" "mesh_deployer1-key" {
  key_name = "mesh_deployer1-key"
  public_key = file("../deployer1-key.pub")
 
}

#2 Security Group (The Firewall)
resource "aws_security_group" "mesh_sg" {
  name = "mesh-security-group"
  description = "Allow SSH and HTTP traffic"
  vpc_id = aws_vpc.mesh_vpc.id

#Inbound Allow SSH (Port 22) for Ansible
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["44.246.216.153/32"]
  }

#Inbound Allow HTTP (Port 80) for nginx
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Inbound: Allow Kubernetes NodePort range
  ingress {
    from_port   = 30000
    to_port     = 32767
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

# Outbound: Allow all traffic (Crucial for downloading packages, Docker/k3s)

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "mesh-sg"
  }
}