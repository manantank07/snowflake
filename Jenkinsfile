pipeline {
    agent any

    stages {
        stage('Run Schemachange') {
            steps {
                script {
                    sh '''
                    sh 'apt-get install wget -y' 
                    sh 'wget https://github.com/snowflakedb/schemachange/releases/download/v0.12.3/schemachange_0.12.3_linux_amd64.tar.gz'
                    sh 'tar -xvf schemachange_0.12.3_linux_amd64.tar.gz'
                    sh 'mv schemachange /usr/local/bin/'
                    schemachange -f migrations -a ${SF_ACCOUNT} -u {SF_USERNAME} -r {SF_ROLE} -w ${SF_WAREHOUSE} -d ${SF_DATABASE} -c ${SF_DATABASE}.SCHEMACHANGE.CHANGE_HISTORY --create-change-history-table
                    '''
                }
            }
        }
    }
}