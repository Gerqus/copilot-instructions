#!/usr/bin/env bash

set -euo pipefail

usage() {
  cat <<'USAGE'
Usage:
  ./install.sh [--codex] [--copilot] <project-root>

Options:
  --codex                Install ./codex/* into <project-root>/.codex/
  --copilot, --github    Install ./github/* into <project-root>/.github/
  -h, --help             Show this help message

Notes:
  - At least one flag (--codex or --copilot) is required.
  - <project-root> can be relative; it will be resolved with realpath.
  - Subdirectories are symlinked, but files are copied.
USAGE
}

die() {
  echo "Error: $*" >&2
  exit 1
}

require_realpath() {
  if ! command -v realpath >/dev/null 2>&1; then
    die "'realpath' is required but was not found in PATH."
  fi
}

link_directory_contents() {
  local source_dir="$1"
  local target_dir="$2"

  local source_dir_abs
  source_dir_abs="$(realpath "$source_dir")"

  local item name dest current_target_abs

  shopt -s dotglob nullglob
  for item in "$source_dir_abs"/*; do
    name="$(basename "$item")"
    dest="$target_dir/$name"

    if [[ -d "$item" ]]; then
      if [[ -L "$dest" ]]; then
        current_target_abs="$(realpath "$dest" 2>/dev/null || true)"
        if [[ "$current_target_abs" == "$item" ]]; then
          echo "Already linked directory: $dest -> $item"
          continue
        fi
      fi

      if [[ -e "$dest" || -L "$dest" ]]; then
        die "Destination already exists and cannot be replaced automatically: $dest"
      fi

      ln -s "$item" "$dest"
      echo "Linked directory: $dest -> $item"
      continue
    fi

    if [[ -f "$item" ]]; then
      if [[ -f "$dest" && ! -L "$dest" ]] && cmp -s "$item" "$dest"; then
        echo "Already copied file: $dest"
        continue
      fi

      if [[ -e "$dest" || -L "$dest" ]]; then
        die "Destination already exists and cannot be replaced automatically: $dest"
      fi

      cp "$item" "$dest"
      echo "Copied file: $item -> $dest"
      continue
    fi

    die "Unsupported source entry type (expected directory or regular file): $item"
  done
  shopt -u dotglob nullglob
}

main() {
  require_realpath

  local install_codex=false
  local install_copilot=false
  local project_root_arg=""

  while [[ $# -gt 0 ]]; do
    case "$1" in
      --codex)
        install_codex=true
        ;;
      --copilot|--github)
        install_copilot=true
        ;;
      -h|--help)
        usage
        exit 0
        ;;
      --)
        shift
        if [[ $# -eq 0 ]]; then
          die "Missing project root path argument."
        fi
        if [[ -n "$project_root_arg" ]]; then
          die "Only one project root path argument is supported."
        fi
        project_root_arg="$1"
        shift
        if [[ $# -gt 0 ]]; then
          die "Unexpected extra arguments: $*"
        fi
        break
        ;;
      -*)
        die "Unknown flag: $1"
        ;;
      *)
        if [[ -n "$project_root_arg" ]]; then
          die "Only one project root path argument is supported. Extra argument: $1"
        fi
        project_root_arg="$1"
        ;;
    esac
    shift
  done

  if [[ "$install_codex" == false && "$install_copilot" == false ]]; then
    die "At least one flag is required: use --codex and/or --copilot."
  fi

  if [[ -z "$project_root_arg" ]]; then
    die "Missing project root path argument."
  fi

  if [[ ! -e "$project_root_arg" ]]; then
    die "Project root path does not exist: $project_root_arg"
  fi

  if [[ ! -d "$project_root_arg" ]]; then
    die "Project root path is not a directory: $project_root_arg"
  fi

  local project_root_abs
  project_root_abs="$(realpath "$project_root_arg")"

  local script_dir
  script_dir="$(realpath "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)")"

  local codex_source="$script_dir/codex"
  local copilot_source="$script_dir/github"

  if [[ "$install_codex" == true ]]; then
    [[ -d "$codex_source" ]] || die "Missing source directory: $codex_source"
    mkdir -p "$project_root_abs/.codex"
    link_directory_contents "$codex_source" "$project_root_abs/.codex"
  fi

  if [[ "$install_copilot" == true ]]; then
    [[ -d "$copilot_source" ]] || die "Missing source directory: $copilot_source"
    mkdir -p "$project_root_abs/.github"
    link_directory_contents "$copilot_source" "$project_root_abs/.github"
  fi

  echo "Installation completed for project root: $project_root_abs"
}

main "$@"
