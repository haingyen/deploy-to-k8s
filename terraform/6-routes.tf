resource "aws_route_table" "public_rtb" {
  vpc_id = aws_vpc.k8s.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw_k8s.id
  }

  tags = {
    Name = "public_rtb_k8s"
  }
}

resource "aws_route_table_association" "rtb_subnet_1" {
  route_table_id = aws_route_table.public_rtb.id
  subnet_id = aws_subnet.public_subnet_1.id
}

resource "aws_route_table_association" "rtb_subnet_2" {
  route_table_id = aws_route_table.public_rtb.id
  subnet_id = aws_subnet.public_subnet_2.id
}