pipeline {
    agent any

    stages {
        stage('Prepare') {   
            agent {
                docker 'node:10.14.0-alpine'
            }   
            steps {        
                sh 'npm install'
            }    
        }
        stage('Build') {
            steps {
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