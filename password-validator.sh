#!/bin/bash

input=$1
error_counter=0

green='\033[1;92m' # Valid
red='\033[1;91m'   # Invalid

# Check whether the input text is longer than 10 digits or not
if ! [[ ${#input} -ge 10 ]];
then 
    echo -e "${red}Password must contain at least 10 chars" && error_counter=1
fi

# Check whether the input text contains capitals
if ! [[ $input =~ [[:upper:]] ]];
then 
    echo -e "${red}Password must contain upper case letters" && error_counter=1 
fi

# Check whether the input text contains lowercase letters
if ! [[ $input =~ [[:lower:]] ]];
then  
    echo -e "${red}Password must contain lower case letters" && error_counter=1 
fi

# Check whether the input text contains numbers
if ! [[ $input =~ [[:digit:]] ]];
then 
    echo -e "${red}Password must contain numbers" && error_counter=1
fi

# Check error_counter. 0 means valid
if [[ $error_counter -eq 1 ]];
then
    echo -e "${red}Password is invalid" && exit 1
else
    echo -e "${green}Password is valid" && exit 0
fi
