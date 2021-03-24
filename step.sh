#!/bin/bash
set -ex

echo "Install Lokalise CLI"

curl -L https://raw.githubusercontent.com/lokalise/lokalise-cli-2-go/master/install.sh | sh

echo "Pull translations"

if [ -z "$langs" ]
then
  ./bin/lokalise2 \
      file download \
      --format $format \
      --token $api_token \
      --project-id $project_id \
      --unzip-to $unzip_to
else
  ./bin/lokalise2 \
      file download \
      --format $format \
      --filter-langs $langs \
      --token $api_token \
      --project-id $project_id \
      --unzip-to $unzip_to
fi
