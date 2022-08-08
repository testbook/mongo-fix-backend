properties([
    parameters([
        choice(choices: 'tb-alpha-api-testbook\ncore\nengage\ntests', description: 'Select the environment that you want to deploy the script', name: 'environment'),
        text(name: 'Path', 
                 defaultValue: '', 
                 description: 'Enter the path of the script file') 
 ])
  
])

node {
     
      String ssh_config=""
      if(env.enviroment == 'tb-alpha-api-testbook'){
             ssh_config="gcloud compute ssh " + env.environment + " --zone asia-south1-c --internal-ip --command" 
      }
      else {
             ssh_config="gcloud compute ssh tb-prod-mongo-" + env.environment + "-primary-new-01 --zone asia-south1-c --internal-ip --command"
      } 
      String app_workspace="/root" 

       
         stage ('Get Latest Code'){
                    sh ("echo \"Getting Code on ${env.environment} in ${env.BRANCH_NAME} environment\"")
                    sh ("${ssh_config} \"sudo bash ${app_workspace}/get_latest_code.sh ${env.BRANCH_NAME} \" ")
                }       

          stage ('Run Service'){
                    sh ("${ssh_config} \"sudo chmod +x ${app_workspace}/${env.Path} && sudo bash ${app_workspace}/${env.Path} \" ")
      	  }
}

