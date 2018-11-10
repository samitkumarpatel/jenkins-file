pipeline {
    agent any
    environment {
        CRED = credentials('github')
    }
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
                echo "The credential is :${env.CRED}"
            }
        }
        stage('shared lib'){
            steps {
                script {
                    @Library(value="jenkins-shared-lib@master", changelog=true)
                    buildset(file=pom.xml)
                }
            }
        }
    }
    post { 
        always { 
            echo 'I will always say Hello again!'
        }
    }
}