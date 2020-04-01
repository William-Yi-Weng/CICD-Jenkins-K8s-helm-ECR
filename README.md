# CI-CDJenkins-K8s-helm-ECR
Please see this Article regarded as the guide of this project.
https://medium.com/@wingyiwy/ci-cd-for-a-piece-java-code-in-jenkins-with-helm-kubernetes-and-aws-ecr-2c3cc1640d25

## Test helm charter
helloworld is a kubernetes deployment deployed by helm chart.
It will pass ECR repo ImageName and ECR ImageTag from value.yaml to deployment_helloworld.yaml

## Files
- CI-CD/
  - deploy/Jenkins_deploy_playbook.yml       # An Ansible script for Helm deployment.
  - helm/
    - Chart.yaml             # A YAML file containing information about the chart.
    - README.md              # A README file.
    - values.yaml            # The default configuration values for this chart
    - templates/             # A directory of templates that, when combined with values,
                             # Will generate valid Kubernetes manifest files. 
      - NOTES.txt                     # A plain text file containing short usage notes
      - deployment_helloworld.yaml    # A kubernetes deployment file for helloworld.
- code/HelloWorld.java       # A piece of Java code.
- Jenkinsfile                # Used to set Jenkins pipeline process.
- Dockerfile                 # Used to bake docker image to ECR repo.
- startup.sh                 # Used to run java code.

## Jenkins pipeline job
### Stage1: Checkout
Jenkins pipeline checks out the merge of branches from Github hook and stores the code into working file. And  it passes the image tag from checkout to the following stages.

### Stage2: Docker Build
Docker builds a new image with updated code and push it into AWS ECR .

### Stage3: Deploy in k8s with Helm
Use Ansible to call Helm chart to deploy the image which contains the code of helloworld from AWS ECR into Kubernetes pods.
