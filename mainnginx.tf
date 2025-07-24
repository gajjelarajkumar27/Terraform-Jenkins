pipeline {
    agent any

    stages {
        stage('Install Nginx') {
            steps {
                sshagent(['k8s']) {  // 'k8s' is the Jenkins credential ID for your private key
                    sh '''
                    ssh -o StrictHostKeyChecking=no ubuntu@44.204.183.236 << 'EOF'
                        sudo apt update
                        sudo apt install -y nginx
                        sudo systemctl start nginx
                        sudo systemctl enable nginx
                    EOF
                    '''
                }
            }
        }
    }
}
