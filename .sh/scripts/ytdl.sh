#!/bin/bash
BASE="$HOME/.sh"
. "$BASE/shlib/util.sh"
. "$BASE/shlib/format.sh"

# ---- config ----
FORMAT="bestvideo[ext!=webm][height<=720]+bestaudio[ext!=webm]/bestvideo+bestaudio/best"
OUTPUT="%(title)s #%(id)s"
DESC_EXT=".desc.txt"
OPTS="--ignore-config"
# ================

ytdl=$(which youtube-dl) || _err "youtube-dl required"

title="$($ytdl $OPTS -s --get-title $@)"
desc="$title$LF$LF$($ytdl $OPTS -s --get-description $@)"
filename="$($ytdl $OPTS -s -o "$OUTPUT" --get-filename $@)"
echo "$desc" > "$filename$DESC_EXT"
echo "$desc"
echo "-------- -"

$ytdl $OPTS -f "$FORMAT" -o "$OUTPUT.%(ext)s" $@
