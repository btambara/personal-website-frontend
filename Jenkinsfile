pipeline {
    agent any
 
    // tools {
    //     nodejs "node"
    // }

    stages {
        stage('Prepare') {      
            steps {        
                sh "apk add nodejs"
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