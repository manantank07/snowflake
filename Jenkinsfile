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
                    sh "pip install schemachange"
                    sh "schemachange -f migrations -a ${SF_ACCOUNT} -u ${SF_USERNAME} -r ${SF_ROLE} -w ${SF_WAREHOUSE} -d ${SF_DATABASE} -c ${SF_DATABASE}.SCHEMACHANGE.CHANGE_HISTORY --create-change-history-table"
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