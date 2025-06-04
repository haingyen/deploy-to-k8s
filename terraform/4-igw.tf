resource "aws_internet_gateway" "igw_k8s" {
  vpc_id = aws_vpc.k8s.id

  tags = {
    Name = "igw_k8s"
  }
}