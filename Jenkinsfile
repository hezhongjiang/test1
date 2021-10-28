pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo "ref  is ${ref}"
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