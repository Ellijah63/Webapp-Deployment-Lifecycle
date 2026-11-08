pipeline {
    agent any
    parameters {
        string(name: 'BRANCH_NAME', defaultValue: 'fe/dev', description: 'Specify the branch name to deploy') 
    }
    stages {
        stage("CHECKOUT"} {
            steps {
              script {
                  // Checkout for specified branch using parameter
                  def branchName = params.BRANCH_NAME
                  checkout([$class: 'GitSCM', branches: [[name: branchName]], userRemoteConfigs: [[url: 'https://github.com/Ellijah63/Webapp-Deployment-Lifecycle.git']]])
              }
            }
         }
        stage("TEST") {
			steps {
				echo "Test Runs"

			}
		}
		stage("BUILD") {
			steps {
				sh "mvn clean package"
				sh "mv target
					
