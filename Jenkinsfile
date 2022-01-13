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
                sh '''
                sudo sysctl -w vm.max_map_count=262144
                docker-compose -f docker-compose.sonar.yml up -d
                '''
            }
        }
        stage("Sonnar scan") {
            steps {
                sh '''
                export PATH=$PATH:/mnt/c/Users/Mykyta_Mironov/Downloads/sonar-scanner-4.6.2.2472-linux/bin
                mvn sonar:sonar \
                -Dsonar.projectKey=final \
                -Dsonar.host.url=http://localhost:9000 \
                -Dsonar.login=4120087c013a83d1eca5515553399a4225155499
                '''
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