#!/bin/bash

set -x

# Set the repository URL
REPO_URL="https://v4xcxuslaoywuyrffcgph6r2j75z5vlnsazl46j6gyyyk7ziycha@dev.azure.com/infoskylinecloud/votingapp/_git/votingapp"

# Clone the git repository into the /tmp directory
git clone "$REPO_URL" /tmp/temp_repo

# Navigate into the cloned repository directory
cd /tmp/temp_repo

# Make changes to the Kubernetes manifest file(s)
# For example, let's say you want to change the image tag in a deployment.yaml file
sed -i "s|image:.*|image: votingappcicddemo.azureecr.io/$2:$3|g" k8s-specifications/$1-deployment.yaml

# Add the modified files
git add .

# Commit the changes
git commit -m "Update Kubernetes manifest"

# Push the changes back to the repository
git push

# Cleanup: remove the temporary directory
rm -rf /tmp/temp_repo