pipeline {
  agent any

  options {
    ansiColor('xterm')
  }

  environment {
    SSH = credentials('SSH')
  }

  stages {

    stage('Only Branch'){
      when { branch pattern:  "ROB-.*", comparator: "REGEXP"}
      steps {
        sh 'env'
        sh 'echo only branch'
      }
    }

    stage('PR'){
      when { branch pattern:  "PR-.*", comparator: "REGEXP"}
      steps {
        sh 'env'
        sh 'echo only PR'
      }
    }


    stage('MAIN'){
      when { branch 'main'}
      steps {
        sh 'env'
        sh 'echo only MAIN'
      }
    }
}
//   Here we are hardcoding role_name as frontend for demo purposes, but we need to underatand which role is realy modified and we need to parse that
//   role name, we can get that info from commands. here is an example. git diff HEAD@{1} --name-only | grep roles | awk - F / '{print $2}'
//     stage('Do dry run') {
//       steps {
//         sh '''
//           env
//           ansible-playbook roboshop-check.yml -e role_name=frontend -e ansible_username=${SSH_USR} -e ansible_password=${SSH_PSW} -e ENV=sandbox -e CHECK_MODE=true
//         '''
//         }
//     }
//   }
}