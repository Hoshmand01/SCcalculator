# Use the official Maven image to build the application
FROM maven:3.6.3-jdk-8 AS build

# Set the working directory inside the container
WORKDIR /app

# Copy the pom.xml file and the source code
COPY pom.xml .
COPY src ./src

# Package the application
RUN mvn clean package

# Use the official Tomcat image to run the application
FROM tomcat:9.0

# Copy the generated WAR file from the build stage
COPY --from=build /app/target/*.war /usr/local/tomcat/webapps/ROOT.war
