pipeline {
    agent any
 
    tools {
        nodejs "node"
    }

    stages {
        stage('Prepare') {      
            steps {        
                sh "npm config ls"
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