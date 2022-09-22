######## STABLE VERSION #############
FROM hanzhukruslan/openjdk16-vault:helper
WORKDIR /app
COPY ./setuper/entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh
COPY target/spring_flyway_local-0.0.1-SNAPSHOT.jar /app/spring_flyway_local-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["/app/entrypoint.sh"]
CMD ["java", "-jar", "spring_flyway_local-0.0.1-SNAPSHOT.jar"]
