# syntax=docker/dockerfile:1
FROM maven:3.9.6-eclipse-temurin-11 as builder
WORKDIR /app
COPY pom.xml ./
COPY ./src ./src
RUN mvn package

# FROM tomcat:8.5.100-jdk11-temurin-jammy
FROM tomcat:8.5.100-jre11-temurin-jammy
COPY --from=builder /app/target/sample.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh", "run"]
