# Use Maven to build the application
FROM maven:3.6.3-jdk-8 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package

# Use Tomcat to deploy the app
FROM tomcat:9.0
COPY --from=build /app/target/java-maven-calculator-web-app-1.1-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war
