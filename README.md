# elasticsearch-fu
Random Elasticsearch scripts and useful commands

## db to db index copy w/ elasticdump (`npm install elasticdump -g`)

`elasticdump --input=http://elastic:<pw>@127.0.0.1:1234/index --output=http://elastic:<pw>@127.0.0.1:1235/index --type=analyzer`

`elasticdump --input=http://elastic:<pw>@127.0.0.1:1234/index --output=http://elastic:<pw>@127.0.0.1:1235/index --type=mapping`

`elasticdump --input=http://elastic:<pw>@127.0.0.1:1234/index --output=http://elastic:<pw>@127.0.0.1:1235/index --type=data`

## Random

Explain cluster issues: `curl localhost:9200/_cluster/allocation/explain`

Get all unassigned shards: `curl localhost:9200/_cat/shards?h=index,shard,prirep,state,unassigned.reason| grep UNASSIGNED`

By default Elasticsearch tries to assign shards to a node 5 times, and after 5 unsuccessful events it does not try again. Force it to retry: `curl -XPOST localhost:9200/_cluster/reroute?retry_failed`

Get cluster health: `curl localhost:9200/_cluster/health`

Explain cluster issues: `curl -u localhost:9200/_cluster/allocation/explain`
