pipeline {

    agent any
    tools {
        maven "mvn-3.9.3"
        jdk   "jdk"
    }
    environment {

    }
    stages {
        stage("mvn build") {
            steps{
                sh 'mvn -DskipTests install'
            }
        }
    }
}