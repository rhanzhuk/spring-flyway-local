######## STABLE VERSION ##########
FROM hanzhukruslan/vault-helper:local as vault-helper
FROM openjdk:16-jdk-alpine
RUN apk add --no-cache jq
WORKDIR /app
COPY --from=vault-helper /app/vault /app/vault
COPY --from=vault-helper /app/envconsul /app/envconsul
COPY ./setuper/entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh
COPY target/spring_flyway_local-0.0.1-SNAPSHOT.jar /app/spring_flyway_local-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["/app/entrypoint.sh"]
CMD ["java", "-jar", "spring_flyway_local-0.0.1-SNAPSHOT.jar"]

######## BETA VERSION #############
# Try to setup vault and envconsul to base image
#FROM hanzhukruslan/openjdk16-alpine:vault-helper
#WORKDIR /app
#COPY ./setuper/entrypoint.sh /app/entrypoint.sh
#RUN chmod +x /app/entrypoint.sh
#COPY target/spring_flyway_local-0.0.1-SNAPSHOT.jar /app/spring_flyway_local-0.0.1-SNAPSHOT.jar
#ENTRYPOINT ["/app/entrypoint.sh"]
#CMD ["java", "-jar", "spring_flyway_local-0.0.1-SNAPSHOT.jar"]
