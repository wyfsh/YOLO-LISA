#!/usr/bin/env bash

DATACFG=$1
CFG=$2
WEIGHTS=$3
OUTPUT=$(echo ${WEIGHTS} | awk -F "." '{print $1}')"_PRC.txt"

rm $OUTPUT -f

THRESHES=(0.0001 0.001 0.002 0.005 0.01 0.02 0.05 0.1 0.15 0.2 0.25 0.3 0.35 0.4 0.45 0.5 0.55 0.6 0.65 0.7 0.75 0.8 0.85 0.9)

for t in ${THRESHES[@]}
do
    echo -e "\nThresh: "${t}
    echo -n -e "Thresh: "${t}"\t" >> $OUTPUT
    ./darknet detector recall $DATACFG $CFG $WEIGHTS -thresh $t >> $OUTPUT
done

echo ${OUTPUT}" saved."
