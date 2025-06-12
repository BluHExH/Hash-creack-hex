#!/bin/bash

clear
echo -e "\e[1;32m"
echo "        ██╗  ██╗███████╗██╗  ██╗         "
echo "        ██║  ██║██╔════╝╚██╗██╔╝         "
echo "        ███████║█████╗   ╚███╔╝          "
echo "        ██╔══██║██╔══╝   ██╔██╗          "
echo "        ██║  ██║███████╗██╔╝ ██╗         "
echo "        ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝         "
echo "         H E X   -   H A S H   C R A C K E R "
echo "       -------------------------------------"
echo -e "\e[0m"

read -p "Enter the hash to crack: " hash
read -p "Enter the path to wordlist: " wordlist

echo -e "\n\e[1;36mCracking hash using wordlist...\e[0m"
echo "-----------------------------------------"

found=0

while read word; do
    md5=$(echo -n $word | md5sum | awk '{print $1}')
    sha1=$(echo -n $word | sha1sum | awk '{print $1}')
    sha256=$(echo -n $word | sha256sum | awk '{print $1}')

    if [[ "$hash" == "$md5" ]]; then
        echo -e "\n\e[1;32m[+] Hash matched (MD5) => $word\e[0m"
        found=1
        break
    elif [[ "$hash" == "$sha1" ]]; then
        echo -e "\n\e[1;32m[+] Hash matched (SHA1) => $word\e[0m"
        found=1
        break
    elif [[ "$hash" == "$sha256" ]]; then
        echo -e "\n\e[1;32m[+] Hash matched (SHA256) => $word\e[0m"
        found=1
        break
    fi
done < $wordlist

if [[ $found -eq 0 ]]; then
    echo -e "\n\e[1;31m[-] No match found.\e[0m"
fi
