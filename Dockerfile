######## STABLE VERSION #############
#FROM hanzhukruslan/openjdk16-vault:helper
FROM gcr.io/distroless/java:11
WORKDIR /app
COPY target/spring_flyway_local-0.0.1-SNAPSHOT.jar /app/spring_flyway_local-0.0.1-SNAPSHOT.jar
CMD ["java", "-jar", "spring_flyway_local-0.0.1-SNAPSHOT.jar"]
