#!/bin/bash

# repo from which this fork was made
or="https://github.com/A2uria/api-ms-win-core-path-l1-1-0.git"

# get basename of current dir
bn=$(basename $(pwd))
# check if basename is in current list of remotes
rn=$(git remote | grep $bn)

if [ "$bn" = "$rn" ]; then
	echo "Original remote repo found."
else
	echo "Adding original remote repo."
	git remote add $bn $or 
fi

git checkout master
git pull origin master
git fetch $rn
git merge $rn/master
git push origin master

read -p "Press enter to close window"
