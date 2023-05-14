pipeline{
   agent: any

   stages{
      stage('Build'){
         steps {
            sh 'printenv'
         }
      }

      stage('Publish ECR'){
          steps{
             withEnv (["AWS_ACCESS_KEY = ${env.AWS_ACCESS_KEY}","AWS_SECRET_KEY = ${env.AWS_SECRET_KEY}","AWS_DEFAULT_REGION = ${env.AWS_DEFAULT_REGION}"]){
     
                 sh "docker login -u AWS -p ${aws ecr-public get-login-password --region us-east-1} public.ecr.aws/i5m8g0d6"
              
                 sh "docker build -t docker_react ."

                 sh "docker tag docker_react:latest public.ecr.aws/i5m8g0d6/docker_react:latest"

                 sh "docker push public.ecr.aws/i5m8g0d6/docker_react:latest"

             }
          }
      }
   }
}
