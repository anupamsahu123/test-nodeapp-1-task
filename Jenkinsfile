pipeline {
    agent {label 'app-worker-node'}
    environment {
        ECR_REPOSITORY = '966272778917.dkr.ecr.us-east-1.amazonaws.com/ecr-ayush-231'
        DOCKER_IMAGE_NAME = 'app-ayush-231'
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
                sh 'aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 966272778917.dkr.ecr.us-east-1.amazonaws.com'
                sh 'docker build -t ecr-ayush-231 .'
                sh 'docker tag ecr-ayush-231:latest 966272778917.dkr.ecr.us-east-1.amazonaws.com/ecr-ayush-231:latest'
                sh 'docker push 966272778917.dkr.ecr.us-east-1.amazonaws.com/ecr-ayush-231:latest'
                    }
                }
            }
        }
    }
}
