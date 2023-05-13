pipeline {
    agent any
    
    stages {
        stage('Build Docker image') {
            steps {
                script {
                    def dockerImage = docker.build("diwa1214/dev:dockerreact1", "--file Dockerfile .")
                }
            }
        }
    }
}
