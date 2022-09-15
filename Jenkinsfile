pipeline {
  agent any

  options {
    ansiColor('xterm')
  }

  environment {
    SSH = credentials('SSH')
    GIT = credentials('mutlipipeline')
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

    stage('TAG'){
      when { branch 'main'
//         expression { env.TAG_NAME != null }
      }
      steps {
        dir('CODE'){
          git branch: 'main',url: "https://${GIT_USR}:${GIT_PSW}@github.com/dotunprom/ansible.git"
          sh '''
            TAG=$(bash /tmp/sort)
            git tag $TAG
            git push --tags
          '''
      }
    }
  }
}
}