pipeline {
    agent any

    // tools {
    //     maven "3.6.0" // You need to add a maven with name "3.6.0" in the Global Tools Configuration page
    // }

    stages {
        stage("Build") {
            steps {
                sh "./mvnw package"
                // sh "java -jar target/*.jar"
            }
        }
          stage('Build Docker Image') {
            steps {
                script {
                  sh 'docker build -t devopshint/my-app-1.0 .'
                }
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}