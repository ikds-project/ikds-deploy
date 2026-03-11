#!/bin/bash

WATCH_DIR=/rdf

echo "Watching $WATCH_DIR for new files..."

inotifywait -m -e create --format '%f' "$WATCH_DIR" | while read FILE
do
    echo "New file detected: $FILE"
    /update.sh "$WATCH_DIR/$FILE"
done
