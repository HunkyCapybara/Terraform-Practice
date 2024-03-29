pipeline {
    agent any

    stages {
        stage('Git Clone') {
            steps {
                git branch: 'main', url: 'https://github.com/HunkyCapybara/Terraform-Practice.git'
            }
        }

        stage('Terraform Init') {
            steps {
                dir('day-2-terraform') {
                    sh 'terraform init'
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                dir('day-2-terraform') {
                    sh 'terraform plan'
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                dir('day-2-terraform') {
                    sh 'terraform destroy -auto-approve'
                }
            }
        }
    }
}
