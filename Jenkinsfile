pipeline { 
    environment { 
        registry = "nikita351/final_project" 
        registryCredential = 'docker' 
        dockerImage = '' 
    }
    agent any 
    stages { 
        stage('Check git repo') { 
            steps { 
                // cleanWs()
                checkout scm 
            }
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