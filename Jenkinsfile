pipeline {
  agent any
  stages {
    stage('Initialization') {
        steps {
            sh 'mkdir -p multirepo/repo1 multirepo/repo2'
        }
    }
    stage('Checking out first') {
      steps {
        dir('multirepo') {
          dir('repo1') {
            git(url: 'https://github.com/bugfender/BugfenderSDK-android-sample.git', branch: 'master')
          }
        }
        sh 'echo "SUCCESS AT REPO1"'
      }
    }
    stage('Checking out second') {
      steps {
        dir('multirepo') {
          dir('repo2') {
            git(url: 'https://github.com/pockethub/PocketHub.git', branch: 'master')
          }
        }
        sh 'echo "SUCCESS AT REPO2"'
      }
    }
  }
}

//pipeline {
//    agent any
//    stages {
//        stage('Build') {
//            steps {
//                sh 'make' 
//                archiveArtifacts artifacts: '**/target/*.jar', fingerprint: true
//            }
//        }
//        stage('Test') {
//            steps {
//                /* `make check` returns non-zero on test failures,
//                * using `true` to allow the Pipeline to continue nonetheless
//                */
//                sh 'make check || true' 
//                junit '**/target/*.xml'
//            }
//        }
//        stage('Deploy') {
//            when {
//              expression {
//                currentBuild.result == null || currentBuild.result == 'SUCCESS' 
//              }
//            }
//            steps {
//                sh 'make publish'
//            }
//        }
//    }
//}
