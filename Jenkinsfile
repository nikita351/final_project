pipeline { 
    environment { 
        registry = "nikita351/final_project" 
        registryCredential = 'nikita351' 
        dockerImage = '' 
    }
    agent any
    stages { 
        stage('Clone SCM') { 
            steps { 
                cleanWs()
                checkout scm 
            }
        }
        stage("Run sonnar") {
            steps {
                sh "docker-compose docker-compose.sonar.yml run"
            }
        stage("Build mvnw") {
            steps {
                script {
                    sh "./mvnw package"
                }
                }
            }
        stage('Building image') { 
            steps { 
                script { 
                    dockerImage = docker.build registry + ":$BUILD_NUMBER" 
                }
            } 
        }
        stage('Push image') { 
            steps { 
                script { 
                    docker.withRegistry( '', registryCredential ) { 
                        dockerImage.push() 
                    }
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