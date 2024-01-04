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
                    sh '''
                        npm install
                    '''
                }
            }
        }

        stage('Test') {
            steps {
                sh '''
                    npm test
                '''
            }
        }

        stage('Build') {
            steps {
                sh '''
                    npm run build
                '''
            }
        }
    }
}