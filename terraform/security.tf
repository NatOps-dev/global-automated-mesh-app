# #1. SSH Pair (This uploads your public key to the AWS region)
resource "aws_key_pair" "final-key" {
  key_name   = "final-key"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC3P3qQppN5Ppdz0MIbJrTNoe2Tc5sDzWShUUC66l+SA37u6QAbafXRzi4Z3yt+aFKaQeHPddZzjXo85ZvXO6eD+grPWtUFgZqrTcys5ymfw/wUvHsKUIRrShSbCWX6sHTHqj+9ql/6AsdETORLw5BN8+SNKeR5x3Z5aeUkSqfBjo/UOXe/TywfDBCBE6izost95tjILItvslYvDnWrQb7tfvf+Zn3HYiIBspu6w8JonsIMRGowzpCt0YJPzobxcFmgTAVuDF5kifNVoY4/7dtimKdgl9YdvK85NtMljyfvFNSLiKMZzamgnywWhB6cD0YdPDR3kkcqDGh3tgVFPRYNxw/MxR6c2nG+D0ZmURyRSoMj9ljVN9oCfe/PF2VSyAaZ9ScAOycN0l7SxfWTTIC0lJ3iFxKfwSwvnVTtP4c/IU0hIA68vkrMp2GR0QzpiHHQUCbVY7VVAcOtvtK/iJNBTWHjGzHFOdbL2So4wU8rbKnD2bMdzTGDgUfIFObqU5CN9Dv7LEf5poyDbWM8oHRJC1NWk2WQBnq3ZzJuQcQXMHxNOtF0ZKBJB6fCGofxxdO+jAKzroAQOyZtfuUSpMpSi5z/BSkrQeYY7QaAwtulcSeWs6GPqegLznK0a0ZB8MVhZ+Dkm+XGWs6VDyaSkv311kUkbidFTMAwNCHcUhm3xQ== nathub@Galaxy-A56-5G"
    }

# #2 Security Group (The Firewall)
resource "aws_security_group" "mesh_sg" {
  name        = "mesh-security-group"
  description = "Allow SSH and HTTP traffic"
  vpc_id      = aws_vpc.mesh_vpc.id

  # Inbound Allow SSH (Port 22) for Ansibles 
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    # cidr_blocks = ["35.163.111.170/32"] #Restrict to your IP for security. Replace with your actual IP or Ansible control node's IP.
    cidr_blocks = ["0.0.0.0/0"] # For testing, allow from anywhere. In production, restrict to your IP or Ansible control node.
  }

  # Inbound Allow HTTP (Port 80) for nginx
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow from anywhere for web traffic. In production, you might want to restrict this further.
  }

  # Inbound: Allow Kubernetes NodePort range for Kubernetes services (30000-32767)
  ingress {
    from_port   = 30000
    to_port     = 32767
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Outbound: Allow all traffic
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