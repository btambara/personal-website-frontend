pipeline {
    agent any
    environment {
        registry = "btambara/personal-website-frontend"
        registryCredential = 'dockerhub'
        dockerImage = ''
    }
    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build registry + ":latest"
                }
            }
        }
        stage('Deploy Docker Image') {
            steps{
                script {
                    docker.withRegistry( '', registryCredential ) {
                        dockerImage.push()
                    }
                }      
            }
        }
    }
}