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

    stage('TAG'){
      when {
        expression { env.TAG_NAME != null }
      }
      steps {
        sh '''
          env
          #!/bin/bash

          C1=$(git tag -l | awk -F . '{print $1}' | sort -n | uniq | tail -1)

          git tag -l | grep "^${C1}" >/tmp/c1

          C2=$(cat /tmp/c1 | awk -F . '{print $2}' | sort -n | uniq | tail -1)

          cat /tmp/c1 | grep "^${C1}\\.${C2}.*" >/tmp/c2

          C3=$(cat /tmp/c2 | awk -F . '{print $3}' | sort -n | uniq | tail -1)

          cat /tmp/c2 | grep "^${C1}\\.${C2}\\.${C3}"
        '''
      }
    }
  }
}