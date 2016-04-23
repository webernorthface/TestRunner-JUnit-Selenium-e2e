#!/bin/sh

# ========================================

GITHUB_ACCOUNT=webernorthface

WS_DIR=TestRunner
REPO_NAME=Title-Validation-url-Selenium-Framework

APP_VERSION=1.1

MAIN_CLASS=core.Selenium

ARGS_01=

# ========================================

if ! which java >/dev/null 2>&1 ; then echo Java not installed; return; fi

if ! which mvn >/dev/null 2>&1 ; then echo Maven not installed; return; fi

if ! which git >/dev/null 2>&1 ; then echo Git not installed; return; fi
if [ -d "$HOME/$WS_DIR" ] ; then cd ~/$WS_DIR; else echo $WS_DIR directory is not exist; return; fi

if [ -d "$HOME/$WS_DIR/$REPO_NAME" ]; then rm -rf $HOME/$WS_DIR/$REPO_NAME; fi

git clone https://github.com/$GITHUB_ACCOUNT/$REPO_NAME.git
cd ./$REPO_NAME
mvn clean site test -Dtest=AllTests -Dbuild.version="1.1"
echo "Executing Java programm ..."

java -cp $HOME/$WS_DIR/$REPO_NAME/target/$REPO_NAME-$APP_VERSION.jar $MAIN_CLASS $ARGS_01