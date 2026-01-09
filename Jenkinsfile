pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub')
        IMAGE_NAME = "anonymousdev56/myapp"
        CONTAINER_NAME = "myapp_container"
    }

    stages {
        stage('Clone') {
            steps {
                git branch: 'main', url: 'https://github.com/AnonymousDev56/ci_cd_test.git'
            }
        }

        stage('Build') {
            steps {
                sh 'docker build -t $IMAGE_NAME:latest .'
            }
        }

        stage('Login to Docker Hub') {
            steps {
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }

        stage('Push to Docker Hub') {
            steps {
                sh 'docker push $IMAGE_NAME:latest'
            }
        }

        stage('Run') {
            steps {
                // Убиваем контейнер, если он уже запущен
                sh 'docker ps -q --filter "name=$CONTAINER_NAME" | grep -q . && docker stop $CONTAINER_NAME && docker rm $CONTAINER_NAME || true'
                // Запускаем новый
                sh 'docker run -d --name $CONTAINER_NAME -p 8082:80 $IMAGE_NAME:latest'
            }
        }
    }
}
