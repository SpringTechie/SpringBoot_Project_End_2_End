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
        copyArtifacts('SPRING_BOOT_END_2_END_PROJECT_INSTALL_JOB') {
            includePatterns('target/SpringBoot_Project_End_2_End-0.0.1-SNAPSHOT.jar')
            buildSelector {
                latestSuccessful(true)
            }
        }
        // ✅ Log the name of the JAR file
        shell('''\
        echo "🔍 Listing copied JAR file:"
        ls -lh target/*.jar
        '''.stripIndent())

        // Now build the Docker image with the copied jar
        shell('''\
        echo "🛠️  Building Docker image..."
        docker build -t springboot-end-end-demo:latest .

        docker images --no-trunc --quiet springboot-end-end-demo:latest > project-id.txt
        '''.stripIndent())
    }
    wrappers {
        credentialsBinding {
            usernamePassword('DOCKER_USERNAME',
            'DOCKER_PASSWORD',
            'docker-hub-creds')
        }
        environmentVariables {
            env('IMAGE_NAME', 'springboot-end-end-demo')
        }
    }

    publishers {
        archiveArtifacts("target/*.jar")
    }

}