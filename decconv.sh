#!/bin/bash

for i in "$@";
do
    echo "ibase=10; obase=16; $i" | bc
done
