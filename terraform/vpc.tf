#terraform/vpc
#Create a Custom VPC

resource "aws_vpc" "mesh_vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true

  tags = {
    Name = "mesh_vpc"
    Project = "Global-Automated-Mesh"
    Environment = "Dev" 
  }
}

#2 create the public Subnet
resource "aws_subnet" "mesh_public_subnet" {
  vpc_id     = aws_vpc.mesh_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-west-2a"

  tags = {
    Name = "mesh_public_subnet" #Use a descriptive name for the subnet
  }
}

#3 Internet Gateway
resource "aws_internet_gateway" "mesh_igw" {
  vpc_id = aws_vpc.mesh_vpc.id

  tags = {
    Name = "mesh_igw"
  }

}

#4 Route Table
resource "aws_route_table" "mesh_public_rt" {
  vpc_id = aws_vpc.mesh_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.mesh_igw.id
  }

  tags = {
    Name = "mesh_route_rt"
  }
}

#5 Associate Route Table with Subnet
resource "aws_route_table_association" "mesh_public_assoc" {
  subnet_id      = aws_subnet.mesh_public_subnet.id
  route_table_id = aws_route_table.mesh_public_rt.id
}