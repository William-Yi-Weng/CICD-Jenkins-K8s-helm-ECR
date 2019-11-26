node {
    def Namespace = "default"
    def ImageName = "helloworld.k8s.java.repo"
    def ECRLink = "https://012345012345.dkr.ecr.us-east-1.amazonaws.com"

    stage ('checkout'){
        final scmVars = checkout(scm)
        ImageTag = "${checkout(scm).GIT_COMMIT}"
    }
        
    stage('Docker Build and Push'){
        dir("${env.WORKSPACE}"){
            docker.build("${ImageName}:latest")
        }
            
        docker.withRegistry("${ECRLink}", 'ecr:us-east-1:aws_access_id'){
            docker.image("${ImageName}").push("${ImageTag}")
        }
     }

    stage('Deploy helloworld on K8s'){
        dir("${env.WORKSPACE}"){
            sh "ansible-playbook ./Jenkins_deploy_playbook.yml  --extra-vars ImageName=${ImageName} --extra-vars imageTag=${ImageTag} --extra-vars Namespace=${Namespace}"
        }
    }
}
