pipeline {
    agent any

    options {
        disableConcurrentBuilds()
        timeout(time: 10, unit: 'MINUTES')
    }

    stages {
        stage('Preparation') {
            steps {
                echo 'Preparing workspace for variant 10...'
                sh 'pwd'
                sh 'ls -la'
                sh 'test -f index.html && test -f test.sh'
            }
        }

        stage('Build') {
            steps {
                echo 'Building ProizvodstvoPro demo...'
                sh 'rm -rf build && mkdir -p build'
                sh 'cp index.html build/index.html'
            }
        }

        stage('Test') {
            steps {
                echo 'Running tests...'
                sh 'sh test.sh'
            }
        }

        stage('Package') {
            steps {
                echo 'Packaging build result...'
                sh 'tar -czf proizvodstvo-pro-v10.tar.gz build'

                archiveArtifacts(
                    artifacts: 'proizvodstvo-pro-v10.tar.gz',
                    fingerprint: true
                )
            }
        }
    }

    post {
        success {
            echo 'Pipeline completed successfully.'
        }

        failure {
            echo 'Pipeline failed. Check Console Output.'
        }

        always {
            echo "Build #${env.BUILD_NUMBER} finished."
        }
    }
}