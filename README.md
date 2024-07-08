
# Simple Calculator Web Application

A simple calculator web application built with Java, Maven, and Spring Boot. It supports basic arithmetic operations and includes DevOps integration with Jenkins, Docker, and JMeter.

This project was originally developed by [maping](https://github.com/maping/java-maven-calculator-web-app) and has been edited for further enhancement.

## Features

- Basic arithmetic operations
- Web-based user interface
- Continuous Integration with Jenkins
- Dockerized for easy deployment
- Performance testing with JMeter

## Getting Started

### Prerequisites

- Java 8
- Maven 3.6.3
- Docker
- Tomcat 9.0
- Jenkins

### Installation



1. Clone the repository:
  
   git clone https://github.com/Hoshmand01/SCcalculator.git
   cd SCcalculator
   

2. Build the project:
  
   mvn clean install
  

3. Deploy the WAR file to Tomcat:
   
   cp target/java-maven-calculator-web-app-1.1-SNAPSHOT.war /path/to/tomcat/webapps/ROOT.war
   

4. Access the application:
   Open `http://localhost:8080` depends on your tomcat port

### Docker

1. Build the Docker image:
  
   docker build -t ahmed181/sc-calculator:latest .
  

2. Run the Docker container:
  
   docker run -p 8080:8080 ahmed181/sc-calculator:latest
   

3. Access the application:
   Open `http://localhost:8080`

## Jenkins Integration

Integrated with Jenkins for continuous integration:
- Build with Maven
- Run unit tests
- Build and push Docker image
- Run JMeter performance tests

## Contributing

1. Fork the repository
2. Create a new branch (`git checkout -b feature-branch`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin feature-branch`)
5. Create a Pull Request


## Acknowledgements

- Original project by [maping](https://github.com/maping/java-maven-calculator-web-app)

---

For more details, visit the [GitHub repository](https://github.com/Hoshmand01/SCcalculator).

