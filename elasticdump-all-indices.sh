#!/bin/bash
# Dump MS es indices - relies on elasticdump
# npm install elasticdump -g

USERNAME=elastic
PASSWORD=changeme
HOST=localhost:9200

for index in $(curl -s -XGET $HOST/_cat/indices | awk '{ print $3 }'); do
  elasticdump \
    --input=http://$USERNAME:$PASSWORD@localhost:1234/$index \
    --output=$index-analyzer.json \
    --type=analyzer
  elasticdump \
    --input=http://$USERNAME:$PASSWORD@localhost:1234/$index \
    --output=$index-mapping.json \
    --type=mapping
  elasticdump \
    --input=http://$USERNAME:$PASSWORD@localhost:1234/$index \
    --output=$index-data.json \
    --type=data
done
