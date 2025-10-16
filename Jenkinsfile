pipeline {
    agent any
    stages {
        stage('Clone') {
            steps {
                git branch: 'main', url: 'https://github.com/AnonymousDev56/ci_cd_test.git'
            }
        }
        stage('Build') {
            steps {
                sh 'docker build -t myapp:latest .'
            }
        }
        stage('Run') {
            steps {
                sh 'docker run -d -p 8080:80 myapp:latest'
            }
        }
    }
}
