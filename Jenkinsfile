#!groovy​

pipeline {
  environment {
    registry = "juliocesarmidia/todo-vue"
    registryCredential = "dockerhub"
    dockerImage = ""
  }
  agent any
  stages {
    stage('Cloning Git') {
      steps {
        checkout scm

        sh "git rev-parse --short HEAD > .git/commit-id"
        sh "cat .git/commit-id"
      }
    }
    stage('Building image') {
      steps{
        script {
          def commitId = sh(returnStdout: true, script: 'git rev-parse --short HEAD').trim()
          dockerImage = docker.build("${registry}:${commitId}")
        }
      }
    }
    stage('Deploy Image') {
      steps{
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
          }
        }
      }
    }
  }
}
