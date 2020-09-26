  node{
        
        stage('git checkout'){
        git credentialsId: 'gitHubPassword', url:'https://github.com/sugandevops/war-test.git'
        }
    
       stage('build & test'){
          def mavenHome = tool name: 'maven-3', type: 'maven'
        def mavenCMD = "${mavenHome}/bin/mvn"
        sh "${mavenCMD} clean package"
        
        }
     stage('build the docker'){
	     sh 'docker build -t sugandevops/suganwebapp:1.0  .'
     }

    stage('push docker image to docker hub'){
	       withCredentials([string(credentialsId: 'dockerPwd' , variable : 'dockerHubPwd')]){
         	sh 'docker login -u sugandevops -p ${dockerHubPwd}'
    }
          sh 'docker push sugandevops/suganwebapp:1.0'    

    }
    stage('run the docker image'){
     sh 'docker run -p 8090:8080 sugandevops/suganwebapp:1.0'
     }
    
}
