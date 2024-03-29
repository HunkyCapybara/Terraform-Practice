node {
    stage('git') {
        git branch: 'main', url: 'https://github.com/HunkyCapybara/Terraform-Practice.git'
    }
    
    stage('terraforminit') {
        dir('day-2-terraform') {
        sh'terraform init'
        
    }
    }
    stage('terraformplan') {
        
        sh'terraform plan'
        
    }
     stage('terraformapply') {
        
        sh'terraform destroy -auto-approve'
        
    }
    
}
  
