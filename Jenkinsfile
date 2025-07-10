pipeline {
    agent {label 'agent-1'}

    stages {
        stage('Git Clone') {
            steps {
                git branch: 'main', credentialsId: '540aa869-c6f6-4365-9aa7-a5272818e765', url: 'https://github.com/SathishKumarMariappan/Demo-jenkins-Deploy.git'
            }
        }

        stage('Pre Build') {
            steps {
                script {
                    sh 'npm install'
                }
            }
        }
      stage('Terraform') {
            steps {
                script {
                    sh '''terraform init
                          terraform apply --auto-approve'''
                }
            }
        }
         stage('Sonar Scan') {
            steps {
                tool name: 'SonarScaner', type: 'hudson.plugins.sonar.SonarRunnerInstallation'
            }
        }
        stage('Replace Env Values') {
            steps {
                script{
                    sh '''
                        cd ~/home/ubuntu/scripts/
                        ./ReplaseValues.sh ~/home/ubuntu/jenkins-agent/pipeline-sample/demo-app/src/environments/environment.ts
                    '''
                }
            }
        }

        stage('Test') {
            steps {
                script {
                    sh 'npm run test'
                }
            }
        }

        stage('Build') {
            steps {
                script {
                    sh 'npm run build'
                }
            }
        }
    }
}
