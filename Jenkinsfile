pipeline {
    agent any

    stages {
        stage('Check Azure CLI Version') {
            steps {
                sh 'az --version'
            }
        }
        stage('Terraform Init') {
            steps {
                sh '''
                    terraform init
                '''
            }
        }
        stage('Terraform Validate') {
            steps {
                sh '''
                    terraform validate
                '''
            }
        }
        stage('SonarQube Scan') {
            steps {
                tool name: 'SonarScanner', type: 'hudson.plugins.sonar.SonarRunnerInstallation'
                sh 'sonar-scanner'
            }
        }
        stage('Terraform Plan') {
            steps {
                sh '''
                    terraform plan
                '''
            }
        }
        stage('Terraform Apply') {
            steps {
                sh '''
                    terraform apply -auto-approve
                '''
            }
        }
        stage('Terraform Destroy (Cleanup)') {
            steps {
                sh '''
                    terraform destroy -auto-approve
                '''
            }
        }
    }
}
