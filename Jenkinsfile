pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'islem646/mini-projet'
    }

    stages {
        stage('clone repo') {
            steps {
                git 'https://github.com/islemnaffouti765/mini-projet.git'
            }
        }
        stage('build') {
            steps {
                script {
                  docker.build("${DOCKER_IMAGE}:1.0")
                }
            }
        }

        stage('pushto docker hub') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'DockerHubCredentials') {
                        docker.image("${DOCKER_IMAGE}:1.0").push()
                    }
                }
            }
        }
    stage('deploy') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-login') {
                        def docker_image = docker.image("${DOCKER_IMAGE}:1.0")
                        docker_image.run('--name mini-projet -p 3000:3000')
                 }
                }
            }
        }
    }
}
