#! /bin/bash

RED='\033[0;31m'   # red
GREEN='\033[0;32m' # green

function validate() {

    text=$1    

    if checkLength $text; then
        if containsNumbers $text; then
            if containsLowercase $text; then
                if containsUppercase $text; then
                    if containSpecialChars $text; then
                        printf "${GREEN}Valid\\n"
                        return 0
                    else
                        printf "${RED}Password must contain special characters\\n"
                        return 1
                    fi
                else
                    printf "${RED}Password must contain upper case letters\\n"
                    return 1
                fi
            else
                printf "${RED}Password must contain lower case letters\\n"
                return 1
            fi
        else
            printf "${RED}Password must contain numbers\\n"
            return 1
        fi
    else
        printf "${RED}Password must contain at least 10 chars\\n"
        return 1
    fi
}
function checkLength() {
    str=$1
    length=${#str}
    if [ $length -ge 10 ]; then
        return 0
    else
        return 1
    fi
}
function containsNumbers() {
    if [[ $1 =~ [0-9] ]]; then
        return 0
    else
        return 1
    fi
}
function containsLowercase() {
    if [[ $1 =~ [a-z] ]]; then
        return 0
    else
        return 1
    fi
}
function containsUppercase() {
    if [[ $1 =~ [A-Z] ]]; then
        return 0
    else
        return 1
    fi
}
function containSpecialChars() {
    if [[ $str == *['!'@\#\$%^\&*()_+]* ]]; then
        return 0
    else
        return 1
    fi
}

validate $1
