FROM openjdk:23-jdk-slim
LABEL authors="springtechie"
WORKDIR /app
COPY target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar" ,"app.jar"]