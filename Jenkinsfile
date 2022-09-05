pipeline {
  agent any

  options {
    ansiColor('xterm')
  }

  environment {
    SSH = credentials('SSH')
  }

  stages {

    stage('Check Ansible Style Checks'){
      when { branch pattern:  "ROB-.*", comparator: "REGEXP"}
      steps {
        echo"Ansible Style Checks"
        // we will find the right tool
      }
    }

    stage('Run Ansible in Sandbox Environment'){
      when { branch pattern:  "PR-.*", comparator: "REGEXP"}
      steps {
        sh '''
          ansible-playbook roboshop-check.yml -e role_name=frontend -e ansible_username=${SSH_USR} -e ansible_password=${SSH_PSW} -e ENV=sandbox -e CHECK_MODE=true
        '''
      }
    }


    stage('Promote code to PROD  Branch') {
      when { branch 'main' }
      steps {
        sh 'env'
        sh 'echo MAIN'

//       sh '''
//         env
//       '''
      }
    }

//     stage('TAG'){
//       when {
//         expression { env.TAG_NAME != ".*" }
//       }
//       steps {
//         sh '''
//           env
//         '''
//       }
//     }
//   }
}