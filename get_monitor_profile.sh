#!/bin/bash

IDS=$(displayplacer list | grep "id: " | cut -d ' ' -f 4 | while read -r PERSISTENT_ID CONTEXT_ID
do
    echo $CONTEXT_ID
    echo $PERSISTENT_ID
done)

FIRST_PERSISTENT_ID=$(echo $IDS | cut -d ' ' -f1)
SECOND_PERSISTENT_ID=$(echo $IDS | cut -d ' ' -f3)
THIRD_PERSISTENT_ID=$(echo $IDS | cut -d ' ' -f5)
FIRST_CONTEXT_ID=$(echo $IDS | cut -d ' ' -f2)
SECOND_CONTEXT_ID=$(echo $IDS | cut -d ' ' -f4)
THIRD_CONTEXT_ID=$(echo $IDS | cut -d ' ' -f6)


# RESOLUTIONS=$(displayplacer list | grep "current mode" | sed  's/^.*[[:blank:]]res\:\([^[:blank:]]*\).*$/\1/')
RESOLUTIONS=$(displayplacer list | grep "Resolution:" | sed 's/^.*Resolution:[[:blank:]]*\(.*\)$/\1/')
FIRST_RESOLUTION=$(echo $RESOLUTIONS | cut -d ' ' -f1)
SECOND_RESOLUTION=$(echo $RESOLUTIONS | cut -d ' ' -f2)
THIRD_RESOLUTION=$(echo $RESOLUTIONS | cut -d ' ' -f3)

ORIGINS=$(displayplacer list | grep 'Origin' | sed 's/^.*Origin:[[:blank:]]*\((.*)\).*$/\1/')
FIRST_ORIGIN=$(echo $ORIGINS | cut -d ' ' -f1)
SECOND_ORIGIN=$(echo $ORIGINS | cut -d ' ' -f2)
THIRD_ORIGIN=$(echo $ORIGINS | cut -d ' ' -f3)

SCALINGS=$(displayplacer list | grep 'Scaling' | sed 's/^.*Scaling:\(.*\)$/\1/')
FIRST_SCALING=$(echo $SCALINGS | cut -d ' ' -f1)
SECOND_SCALING=$(echo $SCALINGS | cut -d ' ' -f2)
THIRD_SCALING=$(echo $SCALINGS | cut -d ' ' -f3)


echo "displayplacer \"id:$FIRST_PERSISTENT_ID res:$FIRST_RESOLUTION scaling:$FIRST_SCALING origin:$FIRST_ORIGIN\" \"id:$SECOND_PERSISTENT_ID res:$SECOND_RESOLUTION scaling:$SECOND_SCALING origin:$SECOND_ORIGIN\" \"id:$THIRD_PERSISTENT_ID res:$THIRD_RESOLUTION scaling:$THIRD_SCALING origin:$THIRD_ORIGIN\""
