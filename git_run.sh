#!/bin/bash

# automate git  push
# set post message


if [ "$#" == "1" ]
then
    echo "pushing to Git"
    # run all relevant Git commands to sync
    git add -A
    git commit -m "$1"
    git push

else
    echo "you need to specify a commit messsage - check quotes or spaces"


fi
