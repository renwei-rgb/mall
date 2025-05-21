# 1. 配置 Elasticsearch
$elasticsearchConfig = @"
http.host: 0.0.0.0
xpack.security.enabled: true
xpack.security.transport.ssl.enabled: true
"@

Set-Content -Path "doc/中?件docker-compse一?安装/elasticsearch/config/elasticsearch.yml" -Value $elasticsearchConfig

# 2. 配置 Kibana
New-Item -ItemType Directory -Force -Path "doc/中?件docker-compse一?安装/kibana/config"

$kibanaConfig = @"
server.host: "0.0.0.0"
elasticsearch.hosts: ["http://192.168.1.46:9200"]
elasticsearch.username: "elastic"
elasticsearch.password: "rw123"
xpack.security.encryptionKey: "mall4cloudmall4cloudmall4cloudmall4cloud"
xpack.encryptedSavedObjects.encryptionKey: "mall4cloudmall4cloudmall4cloudmall4cloud"
xpack.reporting.encryptionKey: "mall4cloudmall4cloudmall4cloudmall4cloud"
"@

Set-Content -Path "doc/中?件docker-compse一?安装/kibana/config/kibana.yml" -Value $kibanaConfig

# 3. 停止并?除?有容器
docker stop mall4cloud-elasticsearch mall4cloud-kibana
docker rm mall4cloud-elasticsearch mall4cloud-kibana

# 4. 重新??服?
docker-compose -f docker-compose-native.yaml up -d mall4cloud-elasticsearch
Write-Host "等待 Elasticsearch ??..."
Start-Sleep -Seconds 30

docker-compose -f docker-compose-native.yaml up -d mall4cloud-kibana

# 5. ?示日志
Write-Host "`nElasticsearch 日志:"
docker logs mall4cloud-elasticsearch

Write-Host "`nKibana 日志:"
docker logs mall4cloud-kibana
