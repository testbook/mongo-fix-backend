properties([
   
   parameters([
        choice(choices: 'alpha-elk-new\nprod-elk', description: 'Select the environment that you want to deploy the code', name: 'environment')
    ])
])

node {

         env.Path = input message: 'Please enter the Path along with file name',
                 parameters: [string(defaultValue: '',
                                     description: '',
                                     name: 'Path')]
   
        String ssh_config="gcloud compute ssh " + env.environment + " --zone asia-south1-c --internal-ip --command"
        String app_workspace="/root/Test/env.Path"
        
            if(env.environment == "alpha-elk-new"){
               
                stage ('Get Latest Code'){
                    sh ("echo \"Getting Code on ${env.environment} environment\"")
                    sh ("${ssh_config} \"sudo bash ${app_workspace}/get_latest_code.sh ${env.BRANCH_NAME} \" ")
                }

                stage ('Add/Replace Configs and restart service'){
                    sh ("${ssh_config} \"sudo chmod +x ${app_workspace} && sudo bash ${app_workspace} \" ")
                }
            }

            if(env.environment == "prod-elk"){
                input message: 'Chote terko sahi me production pe deploy karna hai?'
                echo "Going forward with produciton deployment"

                stage ('Get Latest Code'){
                    sh ("echo \"Getting Code on ${env.environment} environment\"")
                    sh ("${ssh_config} \"sudo bash ${app_workspace}/get_latest_code.sh ${env.BRANCH_NAME} \" ")
                }

                stage ('Add/Replace Configs and restart service'){
                    sh ("${ssh_config} \"sudo chmod +x ${app_workspace} && sudo bash ${app_workspace} \" ")
                }
            }
}
