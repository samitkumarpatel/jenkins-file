pipeline {
    agent any
    stages {
        stage('checkout') {
            steps {
               checkout scm
            }
        }
        stage('env vars details'){
            steps {
                echo "from groovy the env var can be fetch like - ${env.JOB_NAME}"
                sh 'env'
            }
        }
        stage('credentil'){
            steps {
                x = credentials('github')
                echo "the credential is :${x}"
            }
        }
    }
    post { 
        always { 
            echo 'I will always say Hello again!'
        }
    }
}