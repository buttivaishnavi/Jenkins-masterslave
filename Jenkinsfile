pipeline {
    agent none

    stages {
        stage('Checkout on Master') {
            agent { label 'master' }   // Built-In Node
            steps {
                echo "Checking out code on master..."
                checkout scm
                stash name: 'source', includes: '**/*'
            }
        }

        stage('Build on Agent') {
            agent { label 'agent' }   // your agent node
            steps {
                echo "Building on agent..."
                unstash 'source'
                bat 'build.bat'
            }
        }

        stage('Archive') {
            agent { label 'agent' }
            steps {
                archiveArtifacts artifacts: 'out/**,artifact.txt', fingerprint: true
            }
        }
    }
}

