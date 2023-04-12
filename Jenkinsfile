pipeline {
    agent {label 'app-worker-node'}
    environment {
        ECR_REPOSITORY = '249178355403.dkr.ecr.us-east-1.amazonaws.com/ecr_anup_123'
        DOCKER_IMAGE_NAME = 'app-anu-123'
        DOCKER_IMAGE_TAG = 'latest'
        AWS_REGION = 'us-east-1'
    }

    stages {
        stage('Stage 1:Git Checkout') {
            steps {
                checkout scm
            }
        }
        
        stage('Stage 2:Build Docker Image and Push to ECR') {
            steps {
                sh 'aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 249178355403.dkr.ecr.us-east-1.amazonaws.com'
                sh 'docker build -t ecr_anup_123 .'
                sh 'docker tag ecr_anup_123:latest 249178355403.dkr.ecr.us-east-1.amazonaws.com/ecr_anup_123:latest'
                sh 'docker push 249178355403.dkr.ecr.us-east-1.amazonaws.com/ecr_anup_123:latest'
                    }
                }
            }
        }
    
