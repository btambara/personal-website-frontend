pipeline {
    agent any

    stages {
        stage('Prepare') {   
            tools {nodejs "node"}
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