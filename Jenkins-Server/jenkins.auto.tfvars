mykey                = "jenkins"
ami                  = "ami-0ba9883b710b05ac6" # Amazon Linux 2 AMI
region               = "us-east-1"
instance_type        = "t3a.medium" #  If ıt dosen't run, use t3a.large.                          
jenkins_server_secgr = "microservices-jenkins-server-secgr"
jenkins-server-tag   = "Microservices Jenkins Server"
jenkins-profile      = "microservices-jenkins-server-profile"
jenkins-role         = "microservices-jenkins-server-role"