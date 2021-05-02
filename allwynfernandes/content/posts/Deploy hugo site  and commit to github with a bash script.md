---
title: "Deploy hugo site and commit to github with a simple bash script"
date: 2021-05-02
draft: false
slug: "deploy-hugo-site-bash-script"
tags: ['github', 'hugo', 'bash', 'scripting', 'linux', 'ubuntu']
author: "Allwyn"
description: " A bash script to automatically deploy your Hugo site and commit the blog files to a github repo. Make your own custom bash script to build and deploy your hugo site to github"
sounds:
source:
related:
updates: 
---

I have been looking on the internet for quite a while for a half decent bash script to deploy my hugo site and commit the blog related files to github.
I couldn't find much. Just a few YouTubers sharing their hacky idea around the topic. I must say though that they did help me quite a bit.
I ended up creating my own script. I thought I'd share it since it might help others stuck in this space.
I have tried my best to comment the code so that you know what's happening.

## Running the script
First let's look at how to run the script as is.
You can download and run it right away! Just be sure to change the folder path and blog theme.
```bash
./deploysite.sh "new post about bash scripts on 2021-05-02"

```
I hate making people wait for me, the same goes with the programs I use. I'd rather mention my arguments straight up instead of the program issuing a prompt and wait while my clumsy self fills it. So that's what's happening in the double quotes. The `./deploysite.sh` runs the script, the `"new post..."` is my commit message for github.

I love this script because it's like hitting the publish button on Medium or other blogging platforms. Super easy!


## The script
I hope I have commented the code well enough. Feel free to edit the text insde the quotes on the `echo` lines to whatever you'd want the script to tell you. 
I'm not really a fan of entering my github credentials everytime I make a commit which is why I use the `git config` command you can read more about it [here](https://stackoverflow.com/questions/5343068/is-there-a-way-to-cache-github-credentials-for-pushing-commits). In a nutshell, it stores your login details locally so that you don't have to login everytime you push a commit.

Also, the `$1` is just bash for the first argument after the script name. In this case, it is our commit message.

```bash
#!/bin/bash
# bash script to deploy hugo website to github 
# at first run do chmod +x {{name of file}} to get permissions

# Testing bash input
echo "Your string was: $1"


# [0] Collecting variables
echo "Bash script to deploy hugo website to github"

echo "ALERT: Set Github username & password"
echo "------------"
git config --global credential.helper 'cache --timeout 7200'


echo "ALERT: Generating site static files"
echo "------------"
# [1] Generate Hugo static site
cd ~/Github/af/blog/allwynfernandes/
hugo -t PaperMod




echo "ALERT: Code Pushed to blog folder"
echo "------------"
# [2] Push to blog folder
cd ~/Github/af/blog/
git add .
git commit -m "$1"
git push origin main

echo "ALERT: HTML pushed to static folder"
echo "------------"
# [3] Push to satic site folder
cd ~/Github/af/blog/allwynfernandes/public/
git add .
git commit -m "$1"
git push origin main

echo " "
echo "=================="
echo "ALERT: Site deployed successfully"
echo "=================="

```

Now of course if you do not want to mention a commit message, you could simply replace the `"$1"` with something like `"Updated site"`. The code would work a-okay and now you're just a key press away from deploying your site. However, do bear in mind that this is considered bad practice and its necessary to add a meaningful commit message every time you push code to your repo.


The script takes about 1.7 seconds to run and mostly solve my problems and saves me extra keystrokes.
I also added a feature where I don't have to navigate to the specific folder to run the script. I simply open the terminal and type `deploysite "Some commit message"` and everything is taken care of.
I shall cover this in another post on how to run your scripts from anywhere and without the `.sh` extensions and so on. 
I hope the post was help you and that now you're well on your way to create your own bash scripts!
