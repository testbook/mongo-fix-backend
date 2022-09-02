properties([
    parameters([
        choice(choices: 'tb-alpha-api-testbook\ncore\nengage\ntests', description: 'Select the environment that you want to deploy the script', name: 'environment')
  ])
])

//node {
      //sh("echo Testbook")
      //String ssh_config="gcloud compute ssh tb-alpha-api-testbook --zone asia-south1-c --internal-ip --command"
      //if(env.environment == "tb-alpha-api-testbook"){
      //       ssh_config="gcloud compute ssh " + env.environment + " --zone asia-south1-c --internal-ip --command"
      //	     sh("echo ${ssh_config}")

      //}
      //else {
      //       ssh_config="gcloud compute ssh tb-prod-mongo-" + env.environment + "-primary-new-01 --zone asia-south1-c --internal-ip --command"
      //	     sh("echo ${ssh_config}")
      //} 
      //String app_workspace="/root/mongo-fix-backend"
      //sh ("echo ${ssh_config}")
           



      //stage ('Get Latest Code'){
          //  sh ("echo \"Getting Code on ${env.environment} environment and the ssh_config is ${inputTest}\"")
           // sh ("${ssh_config} \"sudo chmod +x ${app_workspace}/get_latest_code.sh && sudo bash ${app_workspace}/get_latest_code.sh ${env.BRANCH_NAME} \" ")
      //}
       
      //stage ('Run Service'){
      //      sh ("${ssh_config} \"sudo chmod +x ${app_workspace}/${env.Path} && sudo bash ${app_workspace}/${env.Path} \" ")
      //}
//}


pipeline {
  agent any
//  stages {
//    stage ("Prompt for input") {
//      steps {
//        script {
//          env.PATH = input message: 'Please enter the full Path',
//                             parameters: [string(defaultValue: '',
//                                          description: '',
//                                          name: 'Path')]
//        }
//        echo "PATH: ${env.Path}"
//      }
//    }

     script {
          env.PATH = input message: 'Please enter the full Path',
                             parameters: [string(defaultValue: '',
                                          description: '',
                                          name: 'Path')]
        }
        echo "PATH: ${env.Path}"    
 
      String ssh_config=""
      if(env.environment == "tb-alpha-api-testbook"){
             ssh_config="gcloud compute ssh " + env.environment + " --zone asia-south1-c --internal-ip --command"
      }
      else {
             ssh_config="gcloud compute ssh tb-prod-mongo-" + env.environment + "-primary-new-01 --zone asia-south1-c --internal-ip --command"
                   sh("echo ${ssh_config}")
      }
      String app_workspace="/root/mongo-fix-backend"     
 
    stage ('Get Latest Code'){
            sh ("echo \"Getting Code on ${env.environment} environment and the ssh_config is ${ssh_config}\"")
            sh ("${ssh_config} \"sudo chmod +x ${app_workspace}/get_latest_code.sh && sudo bash ${app_workspace}/get_latest_code.sh ${env.BRANCH_NAME} \" ")
      }
 
    stage ('Run Service'){
            sh ("${ssh_config} \"sudo chmod +x ${app_workspace}/${env.Path} && sudo bash ${app_workspace}/${env.Path} \" ")
     }
 }
}

