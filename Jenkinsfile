pipeline {
    agent any
    environment {
        APP_NAME = "k8s"
        K8S_NAMESPACE = ""
        DOCKER_HUB_USER = "haingyen"
        DOCKER_TAG = "latest"
        DOCKER_IMAGE = "${DOCKER_HUB_USER}/${APP_NAME}:${DOCKER_TAG}"
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/haingyen/deploy-to-k8s.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                // sh "docker build -t ${DOCKER_IMAGE} ./client"
                script {
                    docker.build("${DOCKER_IMAGE}", "./client")
                }
            }
        }
        stage('Login to Docker Hub') {
            steps {
                withCredentials([string(credentialsId: 'dockerhub-token', variable: 'DOCKER_HUB_TOKEN')]) {
                    sh """
                        # Đăng nhập Docker Hub bằng token
                        echo \$DOCKER_HUB_TOKEN | docker login -u ${DOCKER_HUB_USER} --password-stdin
                    """
                }
            }
        }

        stage('Push Docker Image to Dockerhub') {
            steps {
                sh "docker push ${DOCKER_IMAGE}"
            }
        }

        stage('Deploy To K8s') {
            steps {
                script {
                    // Cập nhật image version trong deployment.yaml
                    sh("sed -i 's|IMAGE_TAG|${DOCKER_IMAGE}|g' k8s/deployment.yaml")

                    // Áp dụng cấu hình Kubernetes
                    sh("kubectl apply -f k8s/deployment.yaml -n ${K8S_NAMESPACE}")
                    
                    // Kiểm tra trạng thái rollout
                    sh("kubectl rollout status deployment/${APP_NAME} -n ${K8S_NAMESPACE}")

                    // Áp dụng cấu hình Ingress
                    sh("kubectl apply -f k8s/letsencrypt-issuer.yaml")
                    sh("kubectl apply -f k8s/ingress.yaml -n ${K8S_NAMESPACE}")
            
                    // Kiểm tra trạng thái
                    sh("kubectl get ingress -n ${K8S_NAMESPACE}")
                }
            }
         }
    }
}