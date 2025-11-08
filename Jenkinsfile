pipeline {
  agent any

  environment {
    ARM_CLIENT_ID       = credentials('AZURE_CLIENT_ID')
    ARM_CLIENT_SECRET   = credentials('AZURE_CLIENT_SECRET')
    ARM_SUBSCRIPTION_ID = credentials('AZURE_SUBSCRIPTION_ID')
    ARM_TENANT_ID       = credentials('AZURE_TENANT_ID')
  }

  stages {
    stage('Checkout') {
      steps {
        git branch: 'main', url: 'https://github.com/prashant18tech/Az_terraformDemo.git'
      }
    }

    stage('Check Existing Resources') {
      steps {
        script {
          // Check Resource Group
          def rg_exists = sh(script: "az group exists --name demo-rg", returnStdout: true).trim()
          env.CREATE_RG = rg_exists == "true" ? "false" : "true"

          // Check Storage Account
          def stg_exists = sh(script: "az storage account check-name --name demostgacct1234 --query 'nameAvailable'", returnStdout: true).trim()
          env.CREATE_STORAGE = stg_exists == "true" ? "true" : "false"

          // Check Virtual Network
          def vnet_exists = sh(script: "az network vnet show --resource-group demo-rg --name demo-vnet --query 'name'", returnStatus: true)
          env.CREATE_VNET = vnet_exists == 0 ? "false" : "true"

          echo "CREATE_RG=${env.CREATE_RG}, CREATE_STORAGE=${env.CREATE_STORAGE}, CREATE_VNET=${env.CREATE_VNET}"
        }
      }
    }

    stage('Terraform Init') {
      steps {
        sh 'terraform init'
      }
    }

    stage('Terraform Plan') {
      steps {
        sh """
          terraform plan \
            -out=tfplan \
            -var="create_rg=${env.CREATE_RG}" \
            -var="create_storage=${env.CREATE_STORAGE}" \
            -var="create_vnet=${env.CREATE_VNET}"
        """
      }
    }

    stage('Terraform Apply') {
      steps {
        sh 'terraform apply -auto-approve tfplan'
      }
    }
  }
}
