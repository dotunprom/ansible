pipeline{
  agent any

  statges {

    stage('Do a Dry Run') {
      steps {
        ssh '''
          ansible-playbook roboshop.yml -e HOST=localhost -e role_name=frontend -C
          '''
      }
      }

  }
}