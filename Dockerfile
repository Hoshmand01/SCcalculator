# Stage 1: Build the application using Maven
FROM maven:3.6.3-jdk-8 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

# Stage 2: Deploy the application using Tomcat
FROM tomcat:9.0
COPY --from=build /app/target/java-maven-calculator-web-app-1.1-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war

# Expose the port that Tomcat runs on
EXPOSE 8086

# Start Tomcat
CMD ["catalina.sh", "run"]
