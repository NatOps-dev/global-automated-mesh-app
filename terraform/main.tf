# 1. The Terraform Settings (Keep this)
terraform {
  backend "s3" {
    bucket = "t2k-terraform-state-bucket"
    key    = "production/terraform.tfstate"
    region = "us-west-2"
  }
}

# 2. The Instance Configuration (ONLY this one)
resource "aws_instance" "mesh_worker" {
  ami           = "ami-05d38da78ce859165"
  instance_type = "t2.micro"

  associate_public_ip_address = true
  subnet_id                   = aws_subnet.mesh_public_subnet.id
  vpc_security_group_ids      = [aws_security_group.mesh_sg.id]
  
  key_name = aws_key_pair.final-key.key_name

  tags = {
    Name      = "mesh-worker-node"
    Project   = "Global-Automated-Mesh"
    ManagedBy = "Terraform"
  }
}

# 3. The Output (Keep this at the bottom)
output "instance_public_ip" {
  value = aws_instance.mesh_worker.public_ip
}