#!/bin/sh

git filter-branch --env-filter '

an="$GIT_AUTHOR_NAME"
am="$GIT_AUTHOR_EMAIL"
cn="$GIT_COMMITTER_NAME"
cm="$GIT_COMMITTER_EMAIL"

if [ "$GIT_COMMITTER_EMAIL" = "name@elabs.se" ]
then
    cn="Nicklas Ramhöj"
    cm="ramhoj@gmail.com"
fi
if [ "$GIT_AUTHOR_EMAIL" = "name@elabs.se" ]
then
    an="Nicklas Ramhöj"
    am="ramhoj@gmail.com"
fi

export GIT_AUTHOR_NAME="$an"
export GIT_AUTHOR_EMAIL="$am"
export GIT_COMMITTER_NAME="$cn"
export GIT_COMMITTER_EMAIL="$cm"
'