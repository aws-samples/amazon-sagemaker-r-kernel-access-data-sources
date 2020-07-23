#!/bin/bash

set -e

sudo -u ec2-user -i <<'EOF'

# This will affect only the Jupyter kernel called "R".
source activate R

# Replace myPackage with the name of the package you want to install.
# You can also perform "conda install" here as well.
conda install -y r-essentials r-base r-rjdbc

source deactivate

# Create directory to host JDBC jar files
mkdir -p ~/jdbc

# Download Hive JDBC Jar file for Hive connection on Amazon EMR
cd ~/jdbc && wget https://repo1.maven.org/maven2/org/apache/hive/hive-jdbc/2.3.6/hive-jdbc-2.3.6-standalone.jar

# Download Presto JBBC Jar file for Presto connection on Amazon EMR
cd ~/jdbc && wget https://repo1.maven.org/maven2/com/facebook/presto/presto-jdbc/0.232/presto-jdbc-0.232.jar

# Download Redshift JDBC Jar file for Amazon Redshift connection
cd ~/jdbc && wget https://s3.amazonaws.com/redshift-downloads/drivers/jdbc/1.2.45.1069/RedshiftJDBC42-no-awssdk-1.2.45.1069.jar

# Download Athena JDBC Jar file for Amazon Athena connection
cd ~/jdbc && wget https://s3.amazonaws.com/athena-downloads/drivers/JDBC/SimbaAthenaJDBC_2.0.9/AthenaJDBC42_2.0.9.jar

# Download MariaDB JDBC Jar file for Aurora MySQL connection
cd ~/jdbc && wget https://downloads.mariadb.com/Connectors/java/connector-java-2.6.0/mariadb-java-client-2.6.0.jar


EOF
