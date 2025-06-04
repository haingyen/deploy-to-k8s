resource "aws_instance" "control_plane" {
  ami = "ami-0672fd5b9210aa093"
  instance_type = "t2.micro" #?????????????????????????????????????????
  subnet_id = aws_subnet.public_subnet_1.id
  key_name = "main-key"
  user_data = join("/n", [
    file("./scripts/install-docker.sh"),
    file("./scripts/install-k8s.sh"),
  ])
  vpc_security_group_ids = [ aws_security_group.sg_k8s.id ]

  tags = {
    Name = "control_plane"
  }
}

resource "aws_instance" "jenkins" {
  ami = "ami-0672fd5b9210aa093"
  instance_type = "t2.micro" #?????????????????????????????????????????
  subnet_id = aws_subnet.public_subnet_2.id
  key_name = "main-key"
  user_data = join("/n", [
    file("./scripts/install-docker.sh"),
    file("./scripts/install-jenkins.sh"),
  ])
  vpc_security_group_ids = [ aws_security_group.sg_k8s.id ]

  tags = {
    Name = "jenkins_k8s"
  }
}

resource "aws_instance" "worker_1" {
  ami = "ami-0672fd5b9210aa093"
  instance_type = "t2.micro" #?????????????????????????????????????????
  subnet_id = aws_subnet.public_subnet_1.id
  key_name = "main-key"
  user_data = join("/n", [
    file("./scripts/install-docker.sh"),
    file("./scripts/install-k8s.sh"),
  ])
  vpc_security_group_ids = [ aws_security_group.sg_k8s.id ]

  tags = {
    Name = "worker_1"
  }
}
resource "aws_instance" "worker_2" {
  ami = "ami-0672fd5b9210aa093"
  instance_type = "t2.micro" #?????????????????????????????????????????
  subnet_id = aws_subnet.public_subnet_2.id
  key_name = "main-key"
  user_data = join("/n", [
    file("./scripts/install-docker.sh"),
    file("./scripts/install-k8s.sh"),
  ])
  vpc_security_group_ids = [ aws_security_group.sg_k8s.id ]

  tags = {
    Name = "worker_2"
  }
}