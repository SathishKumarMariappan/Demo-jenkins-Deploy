pipeline {
    agent {label 'agent-1'}

    stages {
        stage('Git Clone') {
            steps {
                git branch: 'develop', changelog: false, credentialsId: 'b553c60a-a915-4f89-8b2b-f962a6bb1140', poll: false, url: 'https://github.com/SathishKumarMariappan/Demo-jenkins-Deploy.git'
            }
        }

        stage('Pre Build') {
            steps {
                script {
                    sh 'npm install'
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
