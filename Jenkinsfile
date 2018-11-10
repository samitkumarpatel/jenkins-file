pipeline {
    agent any
    stages {
        stage('checkout') {
            steps {
               checkout scm
               sh 'env'
            }
        }
    }
    post { 
        always { 
            echo 'I will always say Hello again!'
        }
    }
}