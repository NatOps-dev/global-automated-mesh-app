# #1. SSH Pair (This uploads your public key to the AWS region)
resource "aws_key_pair" "final-key" {
  key_name   = "final-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDL5jXzEg8ZLsYko6MzkEUwj8XU5BwCt/NW9I3GmXz2nY+lyWGcy9gAzXFQS/Ap1TaG/VfA10fSRjGYhi1dHwSsNpMVBQHwpd2J2IKih0hh4Woe2uqZKfwTgFbViZkR7i/pxYi4dq8RZ2tDlFz2tM+VwGzx+/a6+mLcf7SOZ6P2SfNZ1GJAT7+zOrSOIoV+vAnHjS6QAhTJcaTNh8ahHUKCFpsomXxKuX/BEnWhVtRaXu04WpTQu1KXaL+oOqoEut+MrWqCtowqZvQMrH0v7pbgD5ERogMLn1M8jHaUJHTJa5Vb8D9RKIKtdLxuKNL8VBxuP0/tyV71u9Ees2o0uPAlQudyKHjQjKRgcn17HHRByICvtF1IH1YhiLuQDGyl3NA/soQLdbKZcMIdo03olbRc6B8omN+fVz5rkSdGbM2tvkRqNUu+j368YHXrDDAeCawfNrL01hAUnzAQz6Y/hbuLIynYv/G95qMI4By+sSm+6ldT2jWZee8Yvft02omk6Wc= nathub@Nathaniels-MacBook-Pro.local"
}

# #2 Security Group (The Firewall)
resource "aws_security_group" "mesh_sg" {
  name        = "mesh-security-group"
  description = "Allow SSH and HTTP traffic"
  vpc_id      = aws_vpc.mesh_vpc.id

  # Inbound Allow SSH (Port 22) for Ansible
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    # cidr_blocks = ["34.213.162.113/32"]
    cidr_blocks = ["0.0.0.0/0"] # For testing, allow from anywhere. In production, restrict to your IP or Ansible control node.
  }

  # Inbound Allow HTTP (Port 80) for nginx
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