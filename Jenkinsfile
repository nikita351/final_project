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
    //     stage('Build image') {
    //         steps {         
    //             app = docker.build("myapp/test")
    //         }    
    //    }     
    }

    post {
        always {
            cleanWs()
        }
    }
}