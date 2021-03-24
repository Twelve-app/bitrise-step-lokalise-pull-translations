#!/bin/bash
set -ex

curl -sfL https://raw.githubusercontent.com/lokalise/lokalise-cli-2-go/master/install.sh | sh

if [ -z "$langs" ]
then
  lokalise2 \
      file download \
      --format $format \
      --filter-langs ${1:-en} \
      --token $api_token \
      --project-id $project_id \
      --unzip-to $unzip_to
else
  lokalise2 \
      file download \
      --format $format \
      --filter-langs $langs \
      --token $api_token \
      --project-id $project_id \
      --unzip-to $unzip_to
fi
