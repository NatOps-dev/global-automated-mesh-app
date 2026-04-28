resource "aws_instance" "mesh_worker" {
  ami           = "ami-05d38da78ce859165"
  instance_type = "t2.micro"

  associate_public_ip_address = true

  # FIX: Change 'security_groups' to 'vpc_security_group_ids' 
  # This prevents Terraform from trying to recreate the instance unnecessarily
  subnet_id                   = aws_subnet.mesh_public_subnet.id
  vpc_security_group_ids      = [aws_security_group.mesh_sg.id]
  
  key_name        = aws_key_pair.final-key.key_name
  
  tags = {
    Name      = "mesh-worker-node"
    Project   = "Global-Automated-Mesh"
    ManagedBy = "Terraform"
  }
}

# Ensure this is at the VERY BOTTOM of your main.tf
output "instance_public_ip" {
  value = aws_instance.mesh_worker.public_ip
}