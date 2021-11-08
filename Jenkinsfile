pipeline { 
    environment { 
        registry = "nikita351/final_project" 
        registryCredential = 'docker' 
        dockerImage = '' 
    }
    agent any 
    stages { 
        stage('Cloning our Git') { 
            steps { 
                checkout scm 
            }
        }
        stage("Build") {
            steps {
                sh "./mvnw package"
             }
         }
        stage('Building our image') { 
            steps { 
                script { 
                    docker.build("nikita351/final_project").push() 
                }
            } 
        }
        // stage('Deploy our image') { 
        //     steps { 
        //         script { 
        //             docker.withRegistry( '', registryCredential ) { 
        //                 dockerImage.push() 
        //             }
        //         } 
        //     }
        // } 
        // stage('Cleaning up') { 
        //     steps { 
        //         sh "docker rmi $registry:$BUILD_NUMBER" 
        //     }
        // } 
    }
}