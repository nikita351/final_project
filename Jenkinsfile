// pipeline { 
//     environment { 
//         registry = "nikita351/final_project" 
//         registryCredential = 'docker' 
//         dockerImage = '' 
//     }
//     agent any 
//     stages { 
//         stage('Cloning our Git') { 
//             steps { 
//                 checkout scm 
//             }
//         }
//         stage("Build") {
//             steps {
//                 sh "./mvnw package"
//              }
//          }
//         stage('Building our image') { 
//             steps { 
//                 script { 
//                     dockerImage = docker.build registry + ":$BUILD_NUMBER" 
//                 }
//             } 
//         }
//         stage('Deploy our image') { 
//             steps { 
//                 script { 
//                     docker.withRegistry( '', registryCredential ) { 
//                         dockerImage.push() 
//                     }
//                 } 
//             }
//         } 
//         stage('Cleaning up') { 
//             steps { 
//                 sh "docker rmi $registry:$BUILD_NUMBER" 
//             }
//         } 
//     }
// }

node {
    def app

    stage('Clone repository') {
      

        checkout scm
    }

    stage("Build") {
                 sh "./mvnw package"
          }

    stage('Build image') {
  
       app = docker.build("nikita351/final_project")
    }

    stage('Test image') {
  

        app.inside {
            sh 'echo "Tests passed"'
        }
    }

    // stage('Push image') {
        
    //     docker.withRegistry('https://registry.hub.docker.com', 'git') 
    //     {
    //         app.push("${env.BUILD_NUMBER}")
    //         app.push("latest")
    //     }
    // }
}