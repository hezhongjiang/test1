pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                make sso
                echo "branch: ${env.BRANCH_NAME}"
                echo "current SHA: ${env.GIT_COMMIT}"
                echo "previous SHA: ${env.GIT_PREVIOUS_SUCCESSFUL_COMMIT}"script
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