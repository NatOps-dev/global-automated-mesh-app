#terraform/maiin.tf 
resource "aws_instance" "mesh_worker" {
  # Ubuntu 24.04 LTS AMI for us-west-2
  ami = "ami-05d38da78ce859165"
  instance_type = "t2.micro"

  associate_public_ip_address = true

  # Linking to the networking we built in vpc.tf and security.tf
  subnet_id = aws_subnet.mesh_public_subnet.id
  security_groups = [aws_security_group.mesh_sg.id]
  key_name = aws_key_pair.mesh_deployer1-key.key_name

  tags = {
    Name = " mesh-worker-node"
    Project = "Global-Automated-Mesh"
    ManagedBy = "Terraform"
  }

}

# This output is vital for the next step (Ansible)
output "instance_public_ip" {
  description = "The public IP of the mesh worker node"
  value = aws_instance.mesh_worker.public_ip
}