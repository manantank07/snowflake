pipeline {
    agent any

    stages {
        stage('Run Schemachange') {
            steps {
                script {
                    sh '''
                    sudo apt install python3
                    pip install schemachange --upgrade
                    schemachange -f migrations -a ${SF_ACCOUNT} -u {SF_USERNAME} -r {SF_ROLE} -w ${SF_WAREHOUSE} -d ${SF_DATABASE} -c ${SF_DATABASE}.SCHEMACHANGE.CHANGE_HISTORY --create-change-history-table
                    '''
                }
            }
        }
    }
}