job("SPRING_BOOT_END_2_END_PROJECT_RUN_CONTAINER_JOB") {

    description("🚀 JOB TO RUN SPRING_BOOT_END_2_END_PROJECT CONTAINER")

    steps {
        shell('''\
        echo "🛑 Stopping any existing container..."
        docker stop springboot-end-end-demo-container || true
        docker rm springboot-end-end-demo-container || true

        echo "🚀 Running new container from image..."
        docker run -d --name springboot-end-end-demo-container -p 9090:9090 springboot-end-end-demo:latest

        echo "✅ Container started. Check with: docker ps"
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
