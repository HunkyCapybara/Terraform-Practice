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
                dir('day-2-terraform') {  // Giving this directory path at every satge is important otherwise you will get error
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
                    sh 'terraform apply -auto-approve'
                }
            }
        }
    }
}
