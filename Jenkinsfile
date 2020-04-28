pipeline {
    agent { dockerfile true }

    stages {
        stage('Build') {
            steps {
                echo 'Build DockerImage'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....DockerImage'
            }
        }
    }
}