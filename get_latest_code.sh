#!/bin/bash

# Navigate to script Dir
cd $(dirname $0)

# Script Arguments
branch_name=$1

# Pull latest code
echo "Pulling latest code"
git stash
git checkout ${branch_name}
git pull
