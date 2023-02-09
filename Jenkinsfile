pipeline {
    agent any

    stages {
        stage('Initialisation') {
            steps {
                echo "Started with the Schemachange"
            }
        }
    
        stage('Get Schemachange') {
            steps {
                sh "git clone https://github.com/Snowflake-Labs/schemachange.git"
            }
        }

        stage('Run Schemachange') {
            steps {
                script {
                    sh "python3 -m pip install schemachange"
                    // sh "schemachange --version"
                    sh "python3 schemachange/schemachange/cli.py deploy -f migrations -a ${SF_ACCOUNT} -u ${SF_USERNAME} -r ${SF_ROLE} -w ${SF_WAREHOUSE} -d ${SF_DATABASE} -c ${SF_DATABASE}.SCHEMACHANGE.CHANGE_HISTORY --create-change-history-table"
                }
            }
        }
    }
    post {
        always {
            cleanWs()
        }
    }
}