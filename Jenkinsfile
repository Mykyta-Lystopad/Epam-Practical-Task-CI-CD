pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        
        stage('Build') {
            steps {
                sh 'npm install'
            }
        }
        
        stage('Test') {
            steps {
                sh 'npm test'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("my-image:${env.BRANCH_NAME}")
                }
            }
        }
        
        stage('Deploy') {
            steps {
                script {
                    def port
                    if (env.BRANCH_NAME == 'main') {
                        port = '3000'
                    } else if (env.BRANCH_NAME == 'dev') {
                        port = '3001'
                    }
                    docker.withRegistry('https://registry.example.com', 'my-creds') {
                        docker.image("my-image:${env.BRANCH_NAME}").push("latest")
                        docker.image("my-image:${env.BRANCH_NAME}").push(port)
                    }
                }
            }
        }
    }
}
