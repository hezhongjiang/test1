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
                echo 'Testing...1'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}