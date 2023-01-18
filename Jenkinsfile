pipeline {
    agent any
    docker{
            image "python:3.8"
            args '--user 0:0'
    }

    stages {
        stage('Run Schemachange') {
            steps {
                script {
                    sh '''
                    pip install schemachange --upgrade
                    schemachange -f migrations -a ${SF_ACCOUNT} -u {SF_USERNAME} -r {SF_ROLE} -w ${SF_WAREHOUSE} -d ${SF_DATABASE} -c ${SF_DATABASE}.SCHEMACHANGE.CHANGE_HISTORY --create-change-history-table
                    '''
                }
            }
        }
    }
}