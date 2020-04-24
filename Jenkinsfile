pipeline {
    agent any
 
    tools {
        nodejs "node"
    }
    
    stages {
        stage('Build') {
            steps {
                sh 'npm install'
                sh 'ng build --prod --aot'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}