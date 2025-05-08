#!/bin/bash
# FROM: https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html

PWD=`pwd`

cd /tmp

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install --bin-dir /usr/local/bin --install-dir /usr/local/aws-cli --update

cd $PWD
