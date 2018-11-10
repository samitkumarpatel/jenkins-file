pipeline {
    agent any
    stages {
        stage('checkout') {
            steps {
               checkout scm
               echo "PRINT all the env varibale - groovy and sh will be next ${env}"
               echo "**************************************************************"
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