######## STABLE VERSION #############
#FROM hanzhukruslan/openjdk16-vault:helper
FROM gcr.io/distroless/java:11
#ENV JAVA_HOME="/usr/lib/jvm/java-11-openjdk-amd64/"
WORKDIR /app
COPY target/spring_flyway_local-0.0.1-SNAPSHOT.jar /app/spring_flyway_local-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["java", "-jar", "spring_flyway_local-0.0.1-SNAPSHOT.jar"]
