node {
   def mvnHome = tool 'M3'

   stage('Checkout Code') { 
      git 'https://github.com/Hoshmand01/java-maven-calculator-web-app.git'
   }
   
   stage('Build with Maven') {
      if (isUnix()) {
         sh "'${mvnHome}/bin/mvn' clean package"
      } else {
         bat(/"${mvnHome}\bin\mvn" clean package/)
      }
   }
   
   stage('JUnit Test') {
      if (isUnix()) {
         sh "'${mvnHome}/bin/mvn' test"
      } else {
         bat(/"${mvnHome}\bin\mvn" test/)
      }
   }

   stage('Integration Test') {
      if (isUnix()) {
         sh "'${mvnHome}/bin/mvn' integration-test"
      } else {
         bat(/"${mvnHome}\bin\mvn" integration-test/)
      }
   }

   stage('Performance Test') {
      if (isUnix()) {
         sh "'${mvnHome}/bin/mvn' verify"
      } else {
         bat(/"${mvnHome}\bin\mvn" verify/)
      }
   }

   stage('Build Docker Image') {
      script {
         def app = docker.build("your-docker-hub-username/simple-java-calculator:${env.BUILD_ID}")
      }
   }

   stage('Push Docker Image') {
      script {
         docker.withRegistry('https://index.docker.io/v1/', 'docker-hub-credentials') {
            def app = docker.image("your-docker-hub-username/simple-java-calculator:${env.BUILD_ID}")
            app.push()
            app.push('latest')
         }
      }
   }

   stage('Deploy') {
      timeout(time: 10, unit: 'MINUTES') {
         input message: 'Deploy this web app to production?'
      }
      echo 'Deploy...'
      // Add your deployment steps here
   }
}
