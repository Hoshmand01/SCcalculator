pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'hoshmand001/sc-calculator'
        DOCKER_CREDENTIALS_ID = 'docker-hub-credentials'
        mvnHome = tool name: 'M3', type: 'hudson.tasks.Maven$MavenInstallation'
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/Hoshmand01/java-maven-calculator-web-app.git'
            }
        }

        stage('Build with Maven') {
            steps {
                script {
                    if (isUnix()) {
                        sh "'${mvnHome}/bin/mvn' clean package"
                    } else {
                        bat(/"${mvnHome}\bin\mvn" clean package/)
                    }
                }
            }
        }

        stage('JUnit Test') {
            steps {
                script {
                    if (isUnix()) {
                        sh "'${mvnHome}/bin/mvn' test"
                    } else {
                        bat(/"${mvnHome}\bin\mvn" test/)
                    }
                }
            }
            post {
                always {
                    junit '**/target/surefire-reports/*.xml'
                }
            }
        }

        stage('Integration Test') {
            steps {
                script {
                    if (isUnix()) {
                        sh "'${mvnHome}/bin/mvn' integration-test"
                    } else {
                        bat(/"${mvnHome}\bin\mvn" integration-test/)
                    }
                }
            }
        }

        stage('Performance Test') {
            steps {
                script {
                    if (isUnix()) {
                        sh "'${mvnHome}/bin/mvn' verify"
                    } else {
                        bat(/"${mvnHome}\bin\mvn" verify/)
                    }
                }
            }
            post {
                always {
                    publishPerformanceTestResult(
                        sourceDataFiles: 'results/results.jtl',
                        unstableResponseTimeThreshold: '2000',
                        failureResponseTimeThreshold: '5000',
                        errorFailedThreshold: '0'
                    )
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    def app = docker.build("${DOCKER_IMAGE}:${env.BUILD_ID}")
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', DOCKER_CREDENTIALS_ID) {
                        def app = docker.image("${DOCKER_IMAGE}:${env.BUILD_ID}")
                        app.push()
                        app.push('latest')
                    }
                }
            }
        }

        stage('Deploy') {
            steps {
                timeout(time: 10, unit: 'MINUTES') {
                    input message: 'Deploy this web app to production?'
                }
                echo 'Deploy...'
                // Add your deployment steps here
            }
        }
    }

    post {
        success {
            script {
                // JIRA Integration
                def jiraIssues = findText(text: "${env.BUILD_URL}", regexp: "(JIRA-[0-9]+)")
                if (jiraIssues != null && !jiraIssues.isEmpty()) {
                    for (issue in jiraIssues) {
                        echo "Updating Jira issue ${issue}"
                        jiraTransitionIssue(issueKey: issue, transitionName: 'Done')
                    }
                }
            }
        }

        always {
            cleanWs()
        }
    }
}
