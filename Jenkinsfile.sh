/**
This can be in a seperate Groovy file
Maven.groovy
class Maven {
  static def mvn(steps,_args) {
    return steps.sh(script:"${tool name:'Maven_3_6_2'}/bin/mvn --batch-mode ${_args}",returnStatus:true)
  }  
}
**/

node {
    stage('Maven Build') {
       mvn this,"-X clean install -f /var/git/hello-world-ee/pom.xml"
    }
}
