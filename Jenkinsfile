pipeline {
    agent any

    stage('Fetch Dependencies') {
      agent {
        docker 'node:10.14.0-alpine'
      }
      steps {
        sh 'npm install -g @angular/cli'
        sh 'npm install'
        stash includes: 'node_modules/', name: 'node_modules'
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