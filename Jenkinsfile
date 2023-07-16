pipeline {

    agent any
    tools {
        maven "mvn-3.9.3"
        jdk   "jdk"
    }
    environment {
        NEXUS_DOCKER_REPO_PORT = 5000
        NEXUS_REPOSITORY = "ec2-3-74-164-47.eu-central-1.compute.amazonaws.com:${NEXUS_DOCKER_REPO_PORT}/repository/docker-repo"
    }
    stages {
        stage("mvn build") {
            steps{
                sh 'mvn -DskipTests install'
            }
        }
        stage("build docker image"){
            steps{
                sh 'docker build -t ${NEXUS_repository}/simple-java-tomcat-app:${BUILD_NUMBER} .'
            }
        }
    }
}