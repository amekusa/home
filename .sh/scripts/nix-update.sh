#!/usr/bin/env bash
#
#  Updates the default nixpkgs revision
# -------------------------------------- -
#  author: github.com/amekusa
#  thanks: checkoway.net/musings/nix/
# ============================================ *

base="$HOME/.sh"
. "$base/shlib/format.sh"

echo "Fetching the latest nixpkgs revision via Prometheus API..."
url="https://prometheus.nixos.org/api/v1/query?query=channel_revision"
filter=".data.result[]|select(.metric.status == \"stable\" and .metric.variant == \"darwin\").metric.revision"
if ! rev="$(curl --silent --show-error "$url" | jq -r "$filter")"; then
	_error "failed to fetch the revision"; exit 1
fi
_success "revision: ${MAG}$rev${RST}"

dir="$HOME/.nix-defexpr/nixpkgs"
file="$dir/default.nix"
data="import (fetchTarball \"https://github.com/NixOS/nixpkgs/archive/${rev}.tar.gz\")"

[ -d "$dir" ] || mkdir -p "$dir"
if [ -r "$file" ] && [[ "$(cat "$file")" = "$data"* ]]; then
  echo "nixpkgs already up to date"
  exit
fi
if ! echo "$data # update: $(date +%F)" > $file; then
	_error "failed to write: $file"; exit 1
fi
_success "default nixpkgs has been updated"

cat <<- EOF
Update the packages with:
  nix-env -irf <envfile.nix>

EOF
