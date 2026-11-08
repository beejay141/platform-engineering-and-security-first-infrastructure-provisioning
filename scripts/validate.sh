#!/bin/bash

set -e

modules_and_names=$(git diff --name-only $(git rev-parse origin/main) HEAD | grep ^modules | cut -d/ -f1,2,3 | uniq)
# loop through the $modules_and_names and run the following commands
for module_and_name in $modules_and_names; do
  if [ ! -d "$module_and_name" ]; then
    echo "Non-directory $module_and_name ignored..."
    continue
  fi

  echo "Checking out $module_and_name"
  cd "$module_and_name"
  terraform init
  terraform fmt -check
  terraform validate
  cd -
done
