pipeline {
    agent any
    stages {
        stage('checkout') {
            steps {
               checkout scm
            }
        }
    }
    post { 
        always { 
            echo 'I will always say Hello again!'
        }
    }
}