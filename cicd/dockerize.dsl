job( "SPRING_BOOT_END_2_END_PROJECT_DOCKER_IMAGE_JOB" ) {

    description( "JOB TO CREATE SPRING_BOOT_END_2_END_PROJECT DOCKER_IMAGE" )
    scm {
        git {
            remote {
                url(Constants.REPO_URL)
            }
            branches(Constants.BRANCH_NAME)
        }
    }
    steps {
        // Copy the built JAR from the previous job
        copyArtifacts('SpringBoot Maven Install Jenkins JOB using DSL Script') {
            includePatterns('target/*.jar')
            buildSelector {
                latestSuccessful(true)
            }
        }

        // Now build the Docker image with the copied jar
        shell('''\
        echo "🛠️  Building Docker image..."
        docker build -t springboot-end-end-project:latest .

        docker images --no-trunc --quiet springboot-end-end-project:latest > image-id.txt
        '''.stripIndent())
    }
    wrappers {
        credentialsBinding {
            usernamePassword('DOCKER_USERNAME',
            'DOCKER_PASSWORD',
            'docker-hub-creds')
        }
        environmentVariables {
            env('IMAGE_NAME', 'springboot-end-end-project')
        }
    }

    publishers {
        archiveArtifacts("target/*.jar")
    }

}