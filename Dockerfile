# Use OpenJDK directly
FROM openjdk:17-slim

# Copy the built JAR from the target directory
COPY target/*.jar /app.jar

# Expose the port the application runs on
EXPOSE 8086

# Run the JAR file
ENTRYPOINT ["java", "-jar", "/app.jar"]
