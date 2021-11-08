pipeline { 
    // environment { 
    //     registry = "nikita351/final_project" 
    //     registryCredential = 'docker' 
    //     dockerImage = '' 
    // }
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
                sh "docker build -t nikita351/final_project ."
            } 
        }
        // stage('Deploy our image') { 
        //     steps { 
        //             withDockerRegistry( '', registryCredential ) { 
        //                 sh ''' 
        //                 docker push nikita351/final_project
        //                 ''' 
        //             }
        //     }
        // } 
        // stage('Delete docker image locally') {
        //     steps{
        //         sh 'docker rmi nikita351/final_project'
        //     }
        // }
    }
}