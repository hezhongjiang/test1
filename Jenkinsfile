pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo "branch is ${ref}"
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..11'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}