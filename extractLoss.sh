#!/usr/bin/env bash

LOG=$1
OUTPUT=$2

cat $LOG | grep "avg," | awk '{print $3}' >> $OUTPUT

echo ${OUTPUT}" saved."
