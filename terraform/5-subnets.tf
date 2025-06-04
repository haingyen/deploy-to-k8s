resource "aws_subnet" "public_subnet_1" {
  vpc_id = aws_vpc.k8s.id

  cidr_block = "10.0.0.0/24"
  availability_zone = "ap-southeast-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "public_subnet_1_k8s"
  }
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id = aws_vpc.k8s.id

  cidr_block = "10.0.4.0/24"
  availability_zone = "ap-southeast-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "public_subnet_2_k8s"
  }
}