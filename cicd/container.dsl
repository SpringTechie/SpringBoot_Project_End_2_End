job("SPRING_BOOT_END_2_END_PROJECT_RUN_CONTAINER_JOB") {

    description("JOB TO RUN SPRING_BOOT_END_2_END_PROJECT CONTAINER")

    steps {
        shell('''\
        echo "Stopping any existing container..."
        docker stop ${Constants.APP_CONTAINER} || true
        docker rm ${Constants.APP_CONTAINER} || true

        echo "Running new container from image..."
        docker run -d --name ${Constants.APP_CONTAINER} -p 9090:9090 ${Constants.DOCKER_IMAGE_NAME}:${Constants.DOCKER_IMAGE_TAG}

        echo "Container started. Check with: docker ps"
        '''.stripIndent())
    }

    wrappers {
        credentialsBinding {
            usernamePassword('DOCKER_USERNAME',
            'DOCKER_PASSWORD',
            'docker-hub-creds')
        }
    }
}
