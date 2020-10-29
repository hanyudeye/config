#!/bin/bash

changeSink() {
    INPUTS=$(pacmd list-sink-inputs | grep index|cut -f2 -d":"| sed -e 's/\s//g')
    pacmd set-default-sink "$1"
    for i in $INPUTS
    do
        pacmd move-sink-input "$i" "$1"
    done
}

SINK_IDS=$(pacmd list-sinks | grep index| cut -f2 -d":"| sed -r -e 's/\s//g')
SINKS=$(pacmd list-sinks | grep -E 'index|device.description'| sed -r -e 's/.*index:\s+([0-9])|\s+device\.description\s=\s"([^"]*)"/\1\2/g')

prompt=
n=1
for i in $SINK_IDS
do
    sink_name=$(echo "$SINKS"| head -n $(($n * 2)) | tail -n 1)
    prompt="$prompt$i: $sink_name\n"
    n=$((n + 1))
done
changeSink $(echo -e $prompt | dmenu | sed -e 's/:.*//g')
