#!/usr/bin/env bash

#
# lossely based on 
# https://www.linuxjournal.com/content/parsing-rss-news-feed-bash-script
#

set -o errexit
set -o pipefail
set -o nounset

#
# fail as early as possible
# 

which jq > /dev/null
which base64 > /dev/null

xmlgetnext () {
   local IFS='>'
   read -r -d '<' TAG VALUE
}

version="0"

title=""

while xmlgetnext ; do

   if [[ "${TAG}" = 'title' ]]; then
     title="${VALUE}"
   fi

done < <(jq -r '.rss_base64' | base64 -d)

if [[ -n "$title" ]]; then
  version=$(echo "${title}" | awk '{ print $2 }')
fi

jq -n \
  --arg version "$version" \
  '{"version":$version}' 
