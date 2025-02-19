pipeline { 

    environment { 

        registry = "itsmeteja9/sonarqube2" 

        registryCredential = 'dockerjenkinsintegration' 

        dockerImage = '' 

    }
    agent any 

    stages { 


        stage('Building our image') { 

            steps { 

                script { 

                    dockerImage = docker.build registry + ":$BUILD_NUMBER" 

                }
            } 
        }

        stage('Push image to DockerHub') { 

            steps { 

                script { 

                    docker.withRegistry( '', registryCredential ) { 

                        dockerImage.push() 

                 }

                } 

            }

        } 

        stage('Cleaning up Previous Image from Local Docker Engine') {
    steps {
        script {
            // Uncomment to stop and remove the container first (if you need to clean up containers)
            // bat "docker stop sonarqube1"
            // bat "docker rm sonarqube1"

            def lastSuccessfulBuildID = 0
            def build = currentBuild.previousBuild

            // Loop through previous builds to find the most recent successful one
            while (build != null) {
                if (build.result == "SUCCESS") {
                    lastSuccessfulBuildID = build.id as Integer
                    break
                }
                build = build.previousBuild
            }

            println "Last successful build ID: ${lastSuccessfulBuildID}"

            // Ensure that we have found a valid successful build ID
            if (lastSuccessfulBuildID != 0) {
                // Remove the image from the Docker engine using the build ID
                bat "docker rmi $registry:${lastSuccessfulBuildID}"
            } else {
                println "No successful build found to clean up."
            }
        }
    }
}

    }

}
