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
            echo "${env.JOB_NAME}"
            echo "${env.WORKSPACE}"
            echo "${env.GIT_COMMIT}"
            echo "${env.GIT_BRANCH}"
            echo "${env.GIT_LOCAL_BRANCH}"
            echo "${env.WORKSPACE}"
            echo "${env.WORKSPACE}"
        }
    }
    post { 
        always { 
            echo 'I will always say Hello again!'
        }
    }
}