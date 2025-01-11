#!/bin/bash

HEAD="$(git rev-parse --verify HEAD)"
readonly HEAD
MERGE_HEAD="$(git rev-parse --verify MERGE_HEAD 2>/dev/null)"
# In case of fast-forward, where MERGE_HEAD doesn't exist, use FETCH_HEAD instead.
MERGE_SOURCE="${MERGE_HEAD:-$(git rev-parse --verify FETCH_HEAD 2>/dev/null)}"
readonly MERGE_SOURCE
# This needs to be updated when a GPG key used in commits on github.com
# is updated as in the blog post below.
# https://github.blog/news-insights/company-news/rotating-credentials-for-github-com-and-new-ghes-patches/
SIGNING_KEY_ID="B5690EEEBB952194"
readonly SIGNING_KEY_ID

latest_commit_updating_aqua="$(
  git log "$HEAD".."$MERGE_SOURCE" \
    --grep=aquaproj/aqua \
    --author="renovate\[bot\]" \
    --pretty="%GK %H" |
    awk -v key_id="$SIGNING_KEY_ID" '$1 == key_id { print $2; exit }'
)"
if [[ -z $latest_commit_updating_aqua ]]; then
  echo -e "\033[38;5;118m[INFO]\033[m No aqua update found"
  exit 0
fi

aqua_version="$(
  git show "$latest_commit_updating_aqua":.github/workflows/cli-installation-with-aqua.yaml |
    yq '
    .jobs.cli-installation-with-aqua.steps[]
    | select(.uses == "aquaproj/aqua-installer*")
    | .with.aqua_version
  '
)"

if [[ $aqua_version =~ ^v[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
  echo -e "\033[38;5;118m[INFO]\033[m aqua is updated, run \033[38;5;204mbrew upgrade aquaproj/aqua/aqua@$aqua_version\033[m"
else
  echo -e "\033[38;5;226m[WARN]\033[m workflow file is malformed"
fi
