pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                make sso
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}