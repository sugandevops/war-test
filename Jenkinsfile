  node{
   
   def docker=tool name: 'docker', type: 'dockerTool'
   def dockerHome = "$docker/bin/docker"
    
    stage('git checkout'){
        git credentialsId: 'gitHubPassword', url: 'https://github.com/sugandevops/war-test.git'
    }
    
    stage('build & test'){
          def mavenHome = tool name: 'maven-3', type:'maven'
        def mavenCMD = "${mavenHome}/bin/mvn"
        sh "${mavenCMD} clean package"
        
    }
      stage('build the docker'){
    	sh "${dockerHome} build -t sugandevops/suganwebapp:1.1  ."
     }

    stage('push docker image to docker hub'){

    withCredentials([string(credentialsId: 'dockerPassword', variable: 'dockerHubPassword')]) {
    
    sh "${dockerHome} login -u sugandevops -p ${dockerHubPassword}"
    }
  sh "${dockerHome} push sugandevops/suganwebapp:1.1"   

}
    stage('run the docker image'){
     sh "${dockerHome} run -p 8090:8080 -d sugandevops/suganwebapp:1.1"
}
    
}
