#!/bin/bash

for i in "$@";
do
    echo "ibase=16; $(echo "$i" | tr '[:lower:]' '[:upper:]')" | bc
done
