resource "aws_instance" "mesh_worker" {
  ami           = "ami-05d38da78ce859165"
  instance_type = "t2.micro"

  associate_public_ip_address = true

  # Linking to the networking built in vpc.tf and security.tf
  subnet_id       = aws_subnet.mesh_public_subnet.id
  security_groups = [aws_security_group.mesh_sg.id]
  
  # This reference now matches the resource name in security.tf
  key_name        = aws_key_pair.final-key.key_name

  tags = {
    Name      = "mesh-worker-node"
    Project   = "Global-Automated-Mesh"
    ManagedBy = "Terraform"
  }
}

output "instance_public_ip" {
  description = "The public IP of the mesh worker node"
  value       = aws_instance.mesh_worker.public_ip
}