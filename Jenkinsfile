pipeline {
    agent any

    stages {
        stage('Checkout Frontend') {
            steps {
                // Checkout the frontend repository
                git url: 'https://github.com/FaithThough/lbg-car-react-starter.git', branch: 'main'
            }
        }

        stage('Build Frontend Docker Image') {
            steps {
                script {
                    // Build the Docker image for frontend (React app)
                    docker.build("${FRONTEND_IMAGE}")
                }
            }
        }

        stage('Push Frontend Image') {
            steps {
                script {
                    // Push the frontend Docker image to Docker Hub (or any other registry)
                    docker.withRegistry('https://index.docker.io/v1/', 'dockerhub-credentials') {
                        docker.image("${FRONTEND_IMAGE}").push()
                    }
                }
            }
        }

        stage('Deploy Frontend') {
            steps {
                // You can add your deployment logic here (e.g., deploy to AWS, Kubernetes, etc.)
                echo 'Deploying Frontend...'
            }
        }
    }
}
