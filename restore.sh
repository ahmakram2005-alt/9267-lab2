#!/bin/bash

dir="$1"
malicious_dir="$2"

files=()
for file in "$malicious_dir"/* "$malicious_dir"/.*; do
     if [ -f "$file" ]; then
          files+=("$file")
    fi
done

if [ "${#files[@]}" -eq 0 ]; then
     echo "no malicious files to review"
     exit 0
fi

PS3="choose file number: "
select file in "${files[@]}"; do

   if [ -z "$file" ]; then
       echo "choose numberfrom the list"
       continue
    fi

    name=$(basename "$file")

    echo "1-restore"
    echo "2-permanent delete"
    echo "3-leave in quarantine"

    read -r -p "choose action: " action
    case "$action" in
        1)
           if mv -- "$file" "$dir/";then
              echo "Restored $name to $dir "
            fi;;
        2)
            if rm -- "$file"; then
              echo "$name permanently deleted"
            fi;;
        3) 
           echo "left in quarantine";;
        *) 
            echo "Invalid"
            ;;
    esac
    break
done