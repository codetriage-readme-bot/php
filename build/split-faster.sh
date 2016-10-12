#!/bin/bash

split()
{
    SUBDIR=$1
    SPLIT=$2
    HEADS=$3

    mkdir -p $SUBDIR;

    pushd $SUBDIR;

    for HEAD in $HEADS
    do

        mkdir -p $HEAD

        pushd $HEAD

        git subsplit init https://github.com/fistlab/php.git
        git subsplit update

        time git subsplit publish --heads="$HEAD" --no-tags "$SPLIT"

        popd

    done

    popd

    rm -rf $SUBDIR;
}

split container    src/Fist/Container:https://github.com/fistphp/container.git                "master"
split repository   src/Fist/Repository:https://github.com/fistphp/repository.git              "master"
split database     src/Fist/Database:https://github.com/fistphp/database.git                  "master"
split routing      src/Fist/Routing:https://github.com/fistphp/routing.git                    "master"
split facade       src/Fist/Database:https://github.com/fistphp/facade.git                    "master"
split testing      src/Fist/Testing:https://github.com/fistphp/testing.git                    "master"
