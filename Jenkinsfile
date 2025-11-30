pipeline {
    agent none   // no global agent; each stage picks its own node

    stages {
        stage('Checkout (Master)') {
            agent { label 'master' }   // or the label of your controller
            steps {
                echo "Checking out from GitHub on master..."
                checkout scm
            }
        }

        stage('Build & Run on Agent') {
            agent { label 'build-agent' }  // <-- change to your slave/agent label
            steps {
                echo "Running build on agent node..."
                // For Windows agent:
                bat 'build.bat'
                // For Linux agent use:
                // sh 'chmod +x build.sh && ./build.sh'
            }
        }

        stage('Archive Artifact (Master)') {
            agent { label 'master' }
            steps {
                echo "Archiving artifacts on master..."
                archiveArtifacts artifacts: 'out/**', fingerprint: true
            }
        }
    }
}
