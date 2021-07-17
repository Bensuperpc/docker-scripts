#!/bin/bash
set -euo pipefail
#//////////////////////////////////////////////////////////////
#//   ____                                                   //
#//  | __ )  ___ _ __  ___ _   _ _ __   ___ _ __ _ __   ___  //
#//  |  _ \ / _ \ '_ \/ __| | | | '_ \ / _ \ '__| '_ \ / __| //
#//  | |_) |  __/ | | \__ \ |_| | |_) |  __/ |  | |_) | (__  //
#//  |____/ \___|_| |_|___/\__,_| .__/ \___|_|  | .__/ \___| //
#//                             |_|             |_|          //
#//////////////////////////////////////////////////////////////
#//                                                          //
#//  Script, 2021                                            //
#//  Created: 01, July, 2021                                 //
#//  Modified: 17, July, 2021                                //
#//  file: -                                                 //
#//  -                                                       //
#//  Source: -                                               //
#//  OS: ALL                                                 //
#//  CPU: ALL                                                //
#//                                                          //
#////////////////////////////////////////////////////////////// 

# More info: https://github.com/GoogleContainerTools/container-diff

if (( $# < 1 || $# > 2  )); then
    echo "Need 1 or 2 arguments: <img1> <img2>"
    exit 1
fi

if (( $# == 1 )); then
    container-diff analyze $1 --type=history 2>&1 | tee -a analyze-history.txt
    container-diff analyze $1 --type=file 2>&1 | tee -a analyze-file.txt
    container-diff analyze $1 --type=size 2>&1 | tee -a analyze-size.txt
    container-diff analyze $1 --type=apt 2>&1 | tee -a analyze-apt.txt
    container-diff analyze $1 --type=pip 2>&1 | tee -a analyze-pip.txt

fi

if (( $# == 2 )); then
    container-diff diff $1 $2 --type=history 2>&1 | tee -a diff-history.txt
    container-diff diff $1 $2 --type=file 2>&1 | tee -a diff-file.txt
    container-diff diff $1 $2 --type=size 2>&1 | tee -a diff-size.txt
    container-diff diff $1 $2 --type=apt 2>&1 | tee -a diff-apt.txt
    container-diff diff $1 $2 --type=pip 2>&1 | tee -a diff-pip.txt
fi
