FROM hanzhukruslan/vault-helper:local as vault-helper
#FROM openjdk:11
FROM openjdk:16-jdk-alpine
# TEST jq and later install from vault-helper
RUN apk add --no-cache jq
WORKDIR /app
COPY --from=vault-helper /app/vault /app/vault
COPY --from=vault-helper /app/envconsul /app/envconsul
COPY ./setuper/entrypoint.sh /app/entrypoint.sh
COPY target/spring_flyway_local-0.0.1-SNAPSHOT.jar /app/spring_flyway_local-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["/app/entrypoint.sh"]
CMD ["/bin/sh","-c","env"]
#CMD ["java", "-jar", "spring_flyway_local-0.0.1-SNAPSHOT.jar"]
