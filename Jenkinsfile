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
          usernamePassword(
            credentialsId: 'AWS_ACCESS',
            usernameVariable: 'AWS_ACCESS_KEY_ID',
            passwordVariable: 'AWS_SECRET_ACCESS_KEY'
          )
        ]) {
          sh '''
            terraform plan \
              -var="aws_access_key=$AWS_ACCESS_KEY_ID" \
              -var="aws_secret_key=$AWS_SECRET_ACCESS_KEY"
          '''
        }
      }
    }

    stage('Terraform Apply') {
      steps {
        withCredentials([
          usernamePassword(
            credentialsId: 'AWS_ACCESS',
            usernameVariable: 'AWS_ACCESS_KEY_ID',
            passwordVariable: 'AWS_SECRET_ACCESS_KEY'
          )
        ]) {
          input message: 'Proceed with Terraform apply?'
          sh '''
            terraform apply -auto-approve \
              -var="aws_access_key=$AWS_ACCESS_KEY_ID" \
              -var="aws_secret_key=$AWS_SECRET_ACCESS_KEY"
          '''
        }
      }
    }
  }
}

