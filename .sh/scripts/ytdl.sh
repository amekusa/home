#!/usr/bin/env bash
# ---------------------------------------------------------
#  Download a YouTube video with the best quality of audio
# ========================================================= *
base="$HOME/.sh"
. "$base/modules/ush/load" util
. "$base/modules/ush/load" fmt; _ansi

_chk-cmd ffmpeg
ytdl="$(_fb-cmd yt-dlp youtube-dl)" || _die "yt-dlp or youtube-dl is required"

_help() {
	cat <<- EOF
	ytdl.sh [options] <src>

	Options:
	  -s, --size WxH : limit video size

	EOF
	exit 1
}

# ---- arguments ----
while [ $# -gt 0 ]; do
	case "$1" in
	-h|--help)
		_help
		;;
	-s|--size)
		w="${2%%x*}"
		h="${2##*x}"
		shift
		;;
	-*)
		_die "invalid argument '$1'"
		;;
	*)
		break
	esac
	shift
done

[ -z "$w" ] || size="${size}[width<=${w}]"
[ -z "$h" ] || size="${size}[height<=${h}]"

# ---- config ----
format="bestvideo[ext!=webm]${size}+bestaudio[ext!=webm]/bestvideo+bestaudio/best"
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

