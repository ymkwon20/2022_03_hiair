pipeline {
    agent any
    tools {
        go '1.17.4'
    }
    environment {
        GO111MODULE = 'on'
    }
    stages {
        stage('Backend Compile'){
            steps {
                echo '----Backend Build----'
                sh 'pwd'
                dir('backend') {
                    sh 'pwd'
                    sh 'go build main.go'
                }
                sh 'pwd'
            }
            
        }
    }
}
