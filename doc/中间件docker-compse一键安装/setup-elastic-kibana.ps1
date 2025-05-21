# 1. �z�u Elasticsearch
$elasticsearchConfig = @"
http.host: 0.0.0.0
xpack.security.enabled: true
xpack.security.transport.ssl.enabled: true
"@

Set-Content -Path "doc/��?��docker-compse��?����/elasticsearch/config/elasticsearch.yml" -Value $elasticsearchConfig

# 2. �z�u Kibana
New-Item -ItemType Directory -Force -Path "doc/��?��docker-compse��?����/kibana/config"

$kibanaConfig = @"
server.host: "0.0.0.0"
elasticsearch.hosts: ["http://192.168.1.46:9200"]
elasticsearch.username: "elastic"
elasticsearch.password: "rw123"
xpack.security.encryptionKey: "mall4cloudmall4cloudmall4cloudmall4cloud"
xpack.encryptedSavedObjects.encryptionKey: "mall4cloudmall4cloudmall4cloudmall4cloud"
xpack.reporting.encryptionKey: "mall4cloudmall4cloudmall4cloudmall4cloud"
"@

Set-Content -Path "doc/��?��docker-compse��?����/kibana/config/kibana.yml" -Value $kibanaConfig

# 3. ��~��?��?�L�e��
docker stop mall4cloud-elasticsearch mall4cloud-kibana
docker rm mall4cloud-elasticsearch mall4cloud-kibana

# 4. �d�V??��?
docker-compose -f docker-compose-native.yaml up -d mall4cloud-elasticsearch
Write-Host "���� Elasticsearch ??..."
Start-Sleep -Seconds 30

docker-compose -f docker-compose-native.yaml up -d mall4cloud-kibana

# 5. ?�����u
Write-Host "`nElasticsearch ���u:"
docker logs mall4cloud-elasticsearch

Write-Host "`nKibana ���u:"
docker logs mall4cloud-kibana
