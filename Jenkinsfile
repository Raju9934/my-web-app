pipeline {
    agent any

    environment {
        DOCKER_CREDENTIALS_ID = 'dockerhub-pwd' // Update with your actual Docker Hub credentials ID
        DOCKER_IMAGE_NAME = '2024dock/my-web:v1' // Your Docker Hub image name
    }

    stages {
        stage('Checkout Code') {
            steps {
                git url: 'https://github.com/Raju9934/my-web-app.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh "docker build -t ${DOCKER_IMAGE_NAME} ." // Use the defined environment variable
            }
        }
        
        stage('Docker Login') {
            steps {
                script {
                    // Use Jenkins credentials to log in to Docker Hub
                    withCredentials([usernamePassword(credentialsId: DOCKER_CREDENTIALS_ID, passwordVariable: 'DOCKER_PASS', usernameVariable: 'DOCKER_USER')]) {
                        sh "echo \$DOCKER_PASS | docker login -u \$DOCKER_USER --password-stdin"
                    }
                }
            }
        }
        
        stage('Push Docker Image') {
            steps {
                sh "docker push ${DOCKER_IMAGE_NAME}" // Use the defined environment variable
            }
        }

        stage('Run Docker Container') {
            steps {
                sh "docker Frun -d -p 80:80 --name my-web ${DOCKER_IMAGE_NAME}" // Corrected the container name and used the image variable
            }
        }
    }
}
