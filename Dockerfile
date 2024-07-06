# Use the official Maven image to build the project
FROM maven:3.6.3-jdk-8 as build

# Set the working directory in the container
WORKDIR /app

# Copy the pom.xml file and the source code to the container
COPY pom.xml .
COPY src ./src

# Package the application
RUN mvn clean package

# Use the official Tomcat image to run the application
FROM tomcat:9.0

# Copy the generated WAR file to the webapps directory of Tomcat
COPY --from=build /app/target/simple-java-calculator-1.0-SNAPSHOT.war $CATALINA_HOME/webapps/ROOT.war
