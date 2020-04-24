pipeline {
    // agent any

    agent { docker { image 'node:6.14.4' } }
    environment {
        HOME = '.'
    }

    stages {
        stage('Prepare') {      
            steps {        
                sh "npm install"
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