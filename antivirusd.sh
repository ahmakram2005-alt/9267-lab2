#!/bin/bash

dir="$1"
malicious_dir="$2"
interval_secs="$3"

mkdir -p "$malicious_dir"
scan(){
    for file in "$dir"/* "$dir"/.*; do
       if [ -f "$file" ]; then
          malicious=no
          
          case "$file" in 
            *.exe|*.bat|*.vbs|*.scr|*.ps1)
               malicious=yes;;
          esac
          
          if grep -i -e "virus" -e "trojan" -e "malware" -e "worm" -e "ransomware" "$file" > /dev/null; then
              malicious=yes
          fi

          if [ "$malicious" = yes ]; then
              if cp -- "$file" "$malicious_dir/"; then
                  if rm -- "$file"; then
                       echo "$(basename "$file") is malicious and it is deleted"
                  fi
              fi
          fi
       fi
  done
}
scan

ls -l -- "$dir" > directory-info.last

while true; do
    sleep "$interval_secs"

    ls -l -- "$dir" > directory-info.new

    if ! cmp -s directory-info.last directory-info.new; then
       scan


       ls -l -- "$dir" > directory-info.last
    fi
done



