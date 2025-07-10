pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID_AND_SECRET_KEY')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_ACCESS_KEY_ID_AND_SECRET_KEY')
    }

    stages {
        stage('Checkout Code') {
            steps {
                git 'https://github.com/Moin2811/CICD-Project.git'
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Plan') {
            steps {
                sh 'terraform plan'
            }
        }

        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -auto-approve'
            }
        }
    }
}
