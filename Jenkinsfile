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
        // stage("Sonnar scan") {
        //     steps {
        //         catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
        //             withMaven(maven: 'mvn') {
        //                 sh '''
        //                 mvn sonar:sonar \
        //                 -Dsonar.projectKey=final \
        //                 -Dsonar.host.url=http://localhost:9000 \
        //                 -Dsonar.login=c41bda810fe960f97ab40088d0508de50b641988
        //                 '''
        //                 sh "exit 1"
        //             }
        //         }
        //     }
        // }
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