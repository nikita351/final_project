pipeline { 
    environment { 
        registry = "nikita351/final_project" 
        registryCredential = 'docker' 
        dockerImage = '' 
    }
    agent {label 'ubuntu run_docker'} 
    stages { 
        stage('Check git repo') {
            agent {label 'ubuntu run_docker'} 
            steps { 
                checkout scm 
            }
        }
        stage("Build mvnw") {
            agent {label 'ubuntu run_docker'} 
            steps {
                script {
                    sh "./mvnw package"
                }
             }
         }
        stage('Building image') {
            agent {label 'ubuntu run_docker'} 
            steps { 
                script { 
                    dockerImage = docker.build registry + ":$BUILD_NUMBER" 
                }
            } 
        }
        stage('Push image') {
            agent {label 'ubuntu run_docker'} 
            steps { 
                script { 
                    docker.withRegistry( '', registryCredential ) { 
                        dockerImage.push() 
                    }
                } 
            }
        } 
        stage('Cleaning up') { 
            steps { 
                sh "docker rmi $registry:$BUILD_NUMBER" 
            }
        } 
    }
}