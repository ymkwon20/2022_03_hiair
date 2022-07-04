pipeline {
    agent any
    tools {
        go '1.17.4'
    }
    environment {
        GO111MODULE = 'on'
        MSSQL_CREDS = credentials('sql-server-credentials')
        BUILD_FILE_NAME = "app-release.apk"
        DB_ADR = "172.16.30.105"
    }
    options {
        // This is required if you want to clean before build
        skipDefaultCheckout(true)
    }
    
    stages {
        stage('Cleanup'){
            steps {
                echo '----Clean up workspaces'
                // Clean before build
                cleanWs()
                // We need to explicitly checkout from SCM here
                checkout scm
            }
        }
        stage('Backend'){
            steps {
                echo '----Start backend compiling----'
                dir('backend') {
                    sh 'go build main.go'
                }
                echo '----End backend----'
            }
        }
	    stage('Frontend'){
            steps {
                script {
                    echo '----Start frontend compiling----'
                    dir('frontend') {
                        sh(script:'''
                            sed -i "s/version:.*/version: ${TAG}/" pubspec.yaml
                        ''')
                        sh 'flutter build apk'
                    }
                    
                    echo '----Move the new compiled version to a designated directory'
                    dir('frontend/build/app/outputs/flutter-apk/') {
                        fileOperations([
                            folderCreateOperation("${APK_HOME}/${TAG_NAME}"),
                            fileCopyOperation(includes: "${BUILD_FILE_NAME}", targetLocation: "${APK_HOME}/${TAG_NAME}"),
                        ])
                    }
                    
                    echo '----Update the version info in Database----'
                    sh(script:"""
                        sqlcmd -U $MSSQL_CREDS_USR -P $MSSQL_CREDS_PSW -S ${DB_ADR} \
                        -q "EXEC FAN.dbo.SP_TABLET_APK_01_SELECT '${TAG_NAME}','${BUILD_FILE_NAME}','${APK_HOME}/${TAG_NAME}/${BUILD_FILE_NAME}';"
                    """)
                    
                    echo '----End frontend----'

                }
            }
        }
        post {
            // Clean after build
            always {
                cleanWs(cleanWhenNotBuilt: false,
                    deleteDirs: true,
                    disableDeferredWipeout: true,
                    notFailBuild: true,
                    patterns: [[pattern: '.gitignore', type: 'INCLUDE'],
                               [pattern: '.propsfile', type: 'EXCLUDE']])
            }
        }
    }
}
