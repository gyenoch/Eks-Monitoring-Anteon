sudo su -s /bin/bash jenkins

cd /var/lib/jenkins/

eksctl create cluster -f cluster.yaml

kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.7.1/deploy/static/provider/cloud/deploy.yaml 

# Create a git repo and push all files
git add .
git commit -m 'added scripts, yaml files for CI/CD pipeline'
git push 

# Cd back to ec2-user and run this command
helm plugin install https://github.com/hypnoglow/helm-s3.git

sudo su -s /bin/bash jenkins

export PATH=$PATH:/usr/local/bin

# Check helm version
helm version

# Navigate to the AWS Console and create a database with the following details
Engine options: MySQL
  - Version : 5.0.39
  - Templates: Free tier
  - DB instance identifier: petclinic
  - Master username: root
  - Master password: petclinic
  - Public access: Yes
  - Initial database name: petclinic

# Update k8s/petclinic_chart/templates/mysql-server-service.yaml with the “endpoint” values

# Before running Jenkins Pipeline, push again any changes we made to the GitHub repository with the following commands.
git add .
git commit -m 'added scripts, yaml files for Jenkins pipeline'
git push

# To create a new pipeline, click on the + New Items button. Then, prepare the Jenkins pipeline by using the following values, as shown in the figures below.
- job name: eks-cluster-with-monitoring-anteon
- job type: pipeline
- Description: The production pipeline deploys the Dearing Veterinairan Clinic Java-based web application consisting of 11 microservices to the Amazon EKS cluster with Helm.  We'll monitor Amazon EKS cluster with Anteon.
In the this stage, Whenever the developers push their codes to the GitHub repository, the Jenkins pipeline will run automatically thanks to the GitHub webhook and automatically update our Java-based application running on the web.
- Discard old builds: Days to keep builds=2, Max of builds to keep=2.
- GitHub project:  Project url=https://github.com/cmakkaya/eks-monitoring-with-anteon
- Build Triggers:
      Build periodically: 
- Source Code Management: Git
      Repository URL: https://github.com/cmakkaya/eks-monitoring-with-anteon.git
- Branches to build:
      Branch Specifier: */main 
- Pipeline:
      Script Path: jenkins/jenkinsfile-microservice-app-production
