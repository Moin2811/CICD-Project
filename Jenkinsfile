pipeline {
  agent any
  stages {
    stage('Terraform Init') {
      steps {
        sh 'terraform init'
      }
    }

    stage('Terraform Plan') {
      steps {
        withCredentials([
          string(credentialsId: 'AWS_ACCESS_KEY_ID', variable: 'AWS_ACCESS_KEY_ID'),
          string(credentialsId: 'AWS_SECRET_ACCESS_KEY', variable: 'AWS_SECRET_ACCESS_KEY')
        ]) {
          sh '''
            terraform plan \
              -var="aws_access_key=$AWS_ACCESS_KEY_ID" \
              -var="aws_secret_key=$AWS_SECRET_ACCESS_KEY"
          '''
        }
      }
    }
  }
}
