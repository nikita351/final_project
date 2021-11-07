pipeline {
    agent any
    stages {
        stage("Build") {
            steps {
                sh "./mvnw package"
            }
        }
          stage('Build Docker Image') {
            steps {
                  sh 'docker build -t nikita351/myapp .'
            }
        }
    }
}