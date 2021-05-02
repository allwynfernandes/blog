#!/bin/bash
# bash script to deploy hugo website to github 
# at first run do chmod +x {{name of file}} to get permissions


# [0] Collecting variables
echo "Bash script to deploy hugo website to github"

echo "ALERT: Set Github username & password"
echo "------------"
git config --global credential.helper 'cache --timeout 7200'


echo "ALERT: Generating site static files"
echo "------------"
# [1] Generate Hugo static site
hugo -t PaperMod

echo "ALERT: Code Pushed to blog folder"
echo "------------"
# [2] Push to blog folder
cd  ../
git add .
git commit -m "added new post"
git push origin main

echo "ALERT: HTML pushed to static folder"
echo "------------"
# [3] Push to satic site folder
cd allwynfernandes/public/
git add .
git commit -m "added new post"
git push origin main

echo " "
echo "=================="
echo "ALERT: Site deployed successfully"
echo "=================="
