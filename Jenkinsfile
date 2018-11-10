pipeline {
    agent any
    stages {
        stage('checkout') {
            steps {
               checkout scm
               echo "checkout compleated from env.BRANCH_NAME"
               sh -c 'echo the brach the build had was : $BRANCH_NAME'
            }
        }
    }
    post { 
        always { 
            echo 'I will always say Hello again!'
        }
    }
}