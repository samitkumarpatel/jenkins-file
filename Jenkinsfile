#!groovy
@Library('jenkins-shared-lib@master')_
pipeline {
    agent any
    triggers {
        pollSCM('* * * * *')
    }
    options {
        buildDiscarder(logRotator(numToKeepStr: '5', artifactNumToKeepStr: '1'))
    }
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
                    log.info 'Starting'
                    log.warning 'Nothing to do!'
               }
               buildset()
               buildset 'SAMIT'
            }
        }
        stage('shared lib v2') {
            steps {
                tree()
            }
        }
        stage('current build details') {
            steps {
               echo "${currentBuild}"
            }
        }
        stage('available env variable'){
            steps{
                echo "JOB_NAME - ${env.JOB_NAME}"
                echo "WORKSPACE - ${env.WORKSPACE}"
                echo "GIT_COMMIT - ${env.GIT_COMMIT}"
                echo "GIT_BRANCH - ${env.GIT_BRANCH}"
                echo "GIT_LOCAL_BRANCH - ${env.GIT_LOCAL_BRANCH}"

                echo "printenv"
            }
        }
    }
    post { 
        always { 
            echo 'I will always say Hello again!'
        }
    }
}