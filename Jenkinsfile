pipeline {
    agent any
    parameters {
        string(name: 'BRANCH_NAME', defaultValue: 'Dev', description: 'Specify the branch name to deploy') 
    }
    stages {
        stage("CHECKOUT") {
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
				sh "mv target/ROOT.war target/Webapp-Deployment-Lifecycle.war"
			}
		}
		stage("Dev Deployment") {
			when {
				expression { params.BRANCH_NAME == 'Dev' }
			}
			steps {
				deployToTomcat('10.0.0.173', 'tomcat', 'tomcat', 'http://10.0.0.173:8080/manager/text', '/Webapp-Deployment-Lifecycle', 'Dev')
			}
		}
		stage("Qa Deployment") {
			when {
				expression { params.BRANCH_NAME == 'Qa' }
			}
			steps {
				deployToTomcat('10.0.0.147', 'tomcat', 'tomcat', 'http://10.0.0.147:8080/manager/text', '/Webapp-Deployment-Lifecycle', 'Qa')
			}
		}
		stage("Prod Deployment") {
			when {
				expression { params.BRANCH_NAME == 'main' }
			}
			steps {
				input(message: "Do you want to proceed to PROD?", ok: "Proceed")
				deployToTomcat('10.0.0.17', 'tomcat', 'tomcat', 'http://10.0.0.17:8080/manager/text', '/Webapp-Deployment-Lifecycle', 'Prod')
			}
		}
	}
}				
