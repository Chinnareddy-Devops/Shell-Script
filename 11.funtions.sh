#!/bin/bash

USERID=$(id -u)

TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPTNAME=$0
OUTPUT=/tmp/$SCRIPTNAME-$TIMESTAMP.log

VALIDATE(){
     if [ $1 -ne 0 ]
   then
    echo "$2...FAILURE"
        exit 1
    else
        echo "$2...SUCCESS"
    fi
}

if [ $USERID -ne 0 ]
then
    echo "Plese run the script with root access"
    exit 1 # manually exit if error comes.
else
    echo "you are the super user"
fi

dnf install mysql -y  &>>$OUTPUT

VALIDATE $? "installing mysql"


dnf install git -y  &>>$OUTPUT

VALIDATE $? "installing git"

