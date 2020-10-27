# jenkins-file
janekins file example

# Example 
  * [https://github.com/jenkinsci/pipeline-examples/blob/master/declarative-examples/jenkinsfile-examples/mavenDocker.groovy]
  * [https://gist.github.com/merikan/228cdb1893fca91f0663bab7b095757c]

> for this declarative pipeline sysntex [https://jenkins.io/doc/pipeline/steps/pipeline-utility-steps/#writemavenpom-write-a-maven-project-file] , make sure you have ```pipeline-utility-steps``` jenkins plugins installed

# Declarative Pipeline
#### dynamic stage
```
pipeline {
    agent any
    stages {
        stage('loop') {
            steps {
                script {
                def list=[]
                list << "a"
                list << "b"
                list << "c"
                
                list.each { e -> 
                        stage("${e}") {
                            echo "Hi ${e}"
                        }
                    }
                }
            }
        }
    }
}
```
#### conditional stage in a shared library
```
// x.groovy
def call(body={}) {
    def pipelineParams = [:]
    body.resolveStrategy = Closure.DELEGATE_FIRST
    body.delegate = pipelineParams
    body()

    pipeline {
        agent any
        stages {
            stage('build') {
                when { triggeredBy 'SCMTrigger' }
                steps {
                    echo 'Hello, build'
                }
            }
            stage('deploy') {
                when { equals expected: 2, actual: 5 }
                steps {
                    echo 'Hello, deploy'
                    script {
                        echo "pipelineParams : ${pipelineParams}"
                    }
                }
            }
            stage('release') {
                when {  expression { return pipelineParams.isRelease } }
                steps {
                    echo 'Hello, release'
                    script {
                        echo "pipelineParams : ${pipelineParams}"
                    }
                }
            }
            stage('hello') {
                when {  expression { pipelineParams.message == 'greeting' } }
                steps {
                    echo 'Hello, hello'
                    script {
                        echo "pipelineParams : ${pipelineParams}"
                    }
                }
            }
        }
    }
}

//Jenkinsfile
x() {
  message="greeting"
  isRelease= true
}
```
