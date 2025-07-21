job("SPRING_BOOT_END_2_END_PROJECT_PUSH_TO_DOCKER_HUB_JOB") {
    description("Pushes the springboot-end-end-demo Docker image to Docker Hub")

    parameters {
        stringParam("IMAGE_NAME", "springboot-end-end-demo", "Name of the Docker image")
        stringParam("TAG", "latest", "Docker image tag")
    }

    steps {
        shell('''\
        echo "🔒 Logging into Docker Hub..."
        echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

        echo "🏷️ Tagging the Docker image for Docker Hub..."
        docker tag $IMAGE_NAME:$TAG $DOCKER_USERNAME/$IMAGE_NAME:$TAG

        echo "📤 Pushing the Docker image to Docker Hub..."
        docker push $DOCKER_USERNAME/$IMAGE_NAME:$TAG
        '''.stripIndent())
    }

    wrappers {
        credentialsBinding {
            usernamePassword('DOCKER_USERNAME', 'DOCKER_PASSWORD', 'docker-hub-creds')
        }
        environmentVariables {
            env('IMAGE_NAME', 'springboot-end-end-demo')
        }
    }

    publishers {
        // Optional: archive a text file with image name or push confirmation
        archiveArtifacts('**/project-id.txt')
    }
}
