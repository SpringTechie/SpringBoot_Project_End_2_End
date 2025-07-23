job("SPRING_BOOT_END_2_END_PROJECT_RUN_CONTAINER_JOB") {

    description("JOB TO RUN SPRING_BOOT_END_2_END_PROJECT CONTAINER")

    steps {
        shell('''\
        echo "📦 Stopping any existing container..."
        docker stop $CONTAINER_NAME || true
        docker rm $CONTAINER_NAME || true

        echo "🚀 Running new container from image on custom network..."
        docker run -d \
        --name $CONTAINER_NAME \
        --network my-app-network \
        -p 9090:9090 \
        $IMAGE_NAME:$IMAGE_TAG

        echo "✅ Container started. Run: docker ps"
        '''.stripIndent())
    }

    wrappers {
        credentialsBinding {
            usernamePassword('DOCKER_USERNAME',
            'DOCKER_PASSWORD',
            'docker-hub-creds')
        }
        environmentVariables {
            env('IMAGE_NAME', Constants.DOCKER_IMAGE_NAME)
            env('IMAGE_TAG', Constants.DOCKER_IMAGE_TAG)
            env('CONTAINER_NAME', Constants.APP_CONTAINER)
        }
    }

}
