pipeline {
    agent any
    stages {
        stage('checkout') {
            steps {
               checkout scm
               echo "checkout compleated "
            }
        }
    }
    post { 
        always { 
            echo 'I will always say Hello again!'
        }
    }
}