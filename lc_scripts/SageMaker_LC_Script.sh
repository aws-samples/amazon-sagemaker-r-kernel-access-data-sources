#!/bin/bash

set -e

sudo -u ec2-user -i <<'EOF'

# This will affect only the Jupyter kernel called "R".
source activate R

# Replace myPackage with the name of the package you want to install.
# You can also perform "conda install" here as well.
conda install -y r-essentials r-base r-rjdbc

source deactivate

EOF