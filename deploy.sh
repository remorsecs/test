#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

#
git add -A

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi

git commit -m "$msg"

# Build the project.
hugo # if using a theme, replace with `hugo -t <YOURTHEME>`

cp -rf temp public
rm -rf temp

# Push source code
git push origin master

# Go To Public folder
cd public
# Add changes to git.
git add .

git commit -m "$msg"

# Push source and build repos.
git push origin master

# Come Back up to the Project Root
cd ..
