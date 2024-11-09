#!/usr/bin/env bash
# ---------------------------------------------------------
#  Download a YouTube video with the best quality of audio
# ========================================================= *
base="$HOME/.sh"
. "$base/lib/ush/load" util
. "$base/lib/ush/load" fmt; _ansi

_chk-cmd ffmpeg
ytdl="$(_fb-cmd yt-dlp youtube-dl)" || _die "yt-dlp or youtube-dl is required"

# ---- config ----
format="bestvideo[ext!=webm][height<=720]+bestaudio[ext!=webm]/bestvideo+bestaudio/best"
output="%(title)s #%(id)s"
desc_ext=".desc.txt"
opts="--ignore-config"
# ================

title="$($ytdl $opts -s --get-title $@)"
desc="$title$LF$LF$($ytdl $opts -s --get-description $@)"
filename="$($ytdl $opts -s -o "$output" --get-filename $@)"
echo "$desc"
echo "-------- -"

$ytdl $opts -f "$format" -o "$output.%(ext)s" $@ &&
echo "$desc" > "$filename$desc_ext"

