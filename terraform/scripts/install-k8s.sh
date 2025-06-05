#!/bin/bash
# Cập nhật hệ thống
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y apt-transport-https ca-certificates curl

# Tắt swap (yêu cầu của Kubernetes)
sudo swapoff -a
# Để tắt vĩnh viễn, mở file /etc/fstab và comment dòng có chứa swap
sudo sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab

# Cài đặt Docker (container runtime)
sudo apt-get install -y docker.io
sudo systemctl enable docker
sudo systemctl start docker

sudo apt-get update

# Thêm key GPG chính thức
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.28/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg

# Thêm repository
echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.28/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list

# Cập nhật lại package index
sudo apt-get update

sudo apt-get install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl

# kubectl version --client
# kubeadm version
# kubelet --version