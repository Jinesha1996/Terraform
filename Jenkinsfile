pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                echo 'Building the application...'
                // Add commands to build your application here
            }
        }
        stage('Test') {
            steps {
                echo 'Running unit tests...'
                // Add commands to run unit tests here
                // For example: sh 'pytest'
            }
        }
        stage('Deploy to dev') {
            when {
                allOf {
                    branch 'master'
                    buildingTag()
                }
            }
            steps {
                echo 'Deploying to dev environment...'
                // Add commands to deploy to your dev environment here
                // For example: sh 'ssh user@dev-server "bash deploy.sh"'
            }
        }
    }
