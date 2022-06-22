def DEFAULT_VERSION = "0.0.0"

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
    stages {
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
                    if (TAG != DEFAULT_VERSION ){
                        
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
                                folderCreateOperation("${APK_HOME}/${TAG}"),
                                fileCopyOperation(includes: "${BUILD_FILE_NAME}", targetLocation: "${APK_HOME}/${TAG}"),
                            ])
                        }
                        
                        echo '----Update the version info in Database----'
                        sh(script:"""
    		                sqlcmd -U $MSSQL_CREDS_USR -P $MSSQL_CREDS_PSW -S ${DB_ADR} \
    		                -q "EXEC FAN.dbo.SP_TABLET_APK_01_SELECT '${TAG}','${BUILD_FILE_NAME}','${APK_HOME}/${TAG}/${BUILD_FILE_NAME}';"
                        """)
                        
                        echo '----End frontend----'
                    }
                }
	    }
        }
    }
}
