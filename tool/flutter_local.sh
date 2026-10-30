#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
if [[ ! -s dart_defines.json ]]; then
  echo 'Create dart_defines.json from dart_defines.example.json and set API_TOKEN.' >&2
  exit 1
fi
case "${1:-}" in
  run|test) ;;
  build) [[ $# -ge 2 ]] || { echo 'Specify a build target: apk, appbundle, ios, ipa.' >&2; exit 1; } ;;
  *) echo 'Usage: tool/flutter_local.sh run|test|build <target> [Flutter options]' >&2; exit 1 ;;
esac
exec "${FLUTTER_BIN:-flutter}" "$@" --dart-define-from-file=dart_defines.json
