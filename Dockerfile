FROM openjdk:11
WORKDIR /app
COPY target/*.jar /app/helloworld.jar
CMD ["java", "-jar", "/app/helloworld.jar"]