pipeline {
    agent any
    stages {
        stage("Build") {
            steps {
                sh "./mvnw package"
            }
        }
          stage('Build') {
            
                docker {
                    image 'openjdk:8'
                    // Run the container on the node specified at the top-level of the Pipeline, in the same workspace, rather than on a new node entirely:
                    reuseNode true
                }
          }
    }
}