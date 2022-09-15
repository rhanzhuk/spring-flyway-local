FROM openjdk:11
WORKDIR /app
COPY target/spring_flyway_local-0.0.1-SNAPSHOT.jar /app/spring_flyway_local-0.0.1-SNAPSHOT.jar
#ENTRYPOINT ["java", "-jar", "spring_flyway_local-0.0.1-SNAPSHOT.jar", "--spring.config.location=/vault/secrets/spring/application.properties"]
ENTRYPOINT ["sh", "-c", "ls -la", "/vault/secrets/"]