pipeline {
    agent {label 'app-worker-node'}
    environment {
        ECR_REPOSITORY = '249178355403.dkr.ecr.us-east-1.amazonaws.com/ecr_anup_123'
        DOCKER_IMAGE_NAME = 'ecr_anup_123'
	DOCKER_CONTAINER_NAME = 'app-local-anu-123'
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
                sh 'docker build -t ${DOCKER_IMAGE_NAME} .'
                sh 'docker tag ${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG} ${ECR_REPOSITORY}:${DOCKER_IMAGE_TAG}'
                sh 'docker push ${ECR_REPOSITORY}:${DOCKER_IMAGE_TAG}'
            }
        }
		stage ('image build and Push') {
			steps {
				sh 'docker run -itd -p 8080:8081 --name ${DOCKER_CONTAINER_NAME} ${ECR_REPOSITORY}:${DOCKER_IMAGE_TAG}'
			}
		}
    }
}
