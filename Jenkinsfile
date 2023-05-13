pipeline {
	agent none
  stages {
    stage('Docker Build') {
    	agent any
      steps {
      	sh 'docker build -t diwa1214/dev:dockerreact1 .'
      }
    }
     stage('Push to Elastic Beanstalk') {
  environment {
    AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY')
    AWS_SECRET_ACCESS_KEY = credentials('AWS_SECERT_KEY')
    DOCKER_IMAGE_NAME = 'dockerreact1'
    ELASTIC_BEANSTALK_ENV_NAME = 'Docker-react-env'
    ELASTIC_BEANSTALK_APP_NAME = 'docker-react'
    AWS_REGION = 'eu-central-1'
    AWS_ACCOUNT_ID = '862399869074'
  }
  steps {
    withCredentials([
      [$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AWS_ACCESS_KEY_ID', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']
    ]) {
      sh "eval \$(aws ecr get-login --no-include-email --region ${env.AWS_REGION})"
      sh "docker tag ${env.DOCKER_IMAGE_NAME} ${env.AWS_ACCOUNT_ID}.dkr.ecr.${env.AWS_REGION}.amazonaws.com/${env.DOCKER_IMAGE_NAME}"
      sh "docker push ${env.AWS_ACCOUNT_ID}.dkr.ecr.${env.AWS_REGION}.amazonaws.com/${env.DOCKER_IMAGE_NAME}"
      sh "eb init ${env.ELASTIC_BEANSTALK_APP_NAME} --region ${env.AWS_REGION} --platform Docker"
      sh "eb use ${env.ELASTIC_BEANSTALK_ENV_NAME}"
      sh "eb deploy"
    }
  }
}
  }
 
}