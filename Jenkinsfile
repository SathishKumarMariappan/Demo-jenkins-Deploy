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
                    cd terraform
                    terraform init
                '''
            }
        }
        stage('Terraform Validate') {
            steps {
                sh '''
                    cd terraform
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
                    cd terraform
                    terraform plan
                '''
            }
        }
        stage('Terraform Apply') {
            steps {
                sh '''
                    cd terraform
                    terraform apply -auto-approve
                '''
            }
        }
        stage('Terraform Destroy (Cleanup)') {
            steps {
                sh '''
                    cd terraform
                    terraform destroy -auto-approve
                '''
            }
        }
    }
}
