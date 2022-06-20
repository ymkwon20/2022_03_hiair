pipeline {
    agent any
    tools {
        go '1.17.4'
    }
    environment {
        GO111MODULE = 'on'
    }
    stages {
        stage('Backend Compile') {
            steps {
		echo '----Backend Build----'
                sh 'cd backend'
		sh 'go mod tidy'
                sh 'go build main.go'
            }
        }
    }
}

