# 设置项目路径
$projectPath = "D:\tss-project\b2c\mall4cloud\mall4cloud-gateway"

# Step 1: 进入网关模块目录
Set-Location $projectPath
Write-Host "[+] 进入网关模块目录: $projectPath"

# Step 2: 清理并打包 jar
Write-Host "[+] 正在清理和打包 jar 文件..."
# 添加强制清理 Maven 本地仓库缓存的逻辑
Write-Host "[+] 强制清理 Maven 本地仓库缓存..."
mvn dependency:purge-local-repository -DreResolve=false
if ($LASTEXITCODE -ne 0) {
    Write-Error "[!] Maven 本地仓库清理失败，请检查错误"
    exit 1
}
mvn clean package
if ($LASTEXITCODE -ne 0) {
    Write-Error "[!] Maven 构建失败，请检查错误"
    exit 1
}

# Step 3: 创建 Dockerfile（如果不存在）
if (-Not (Test-Path "Dockerfile")) {
    Write-Host "[+] 创建 Dockerfile..."
    @'
FROM openjdk:17-jdk-slim
WORKDIR /app
COPY target/mall4cloud-gateway.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]
'@ | Out-File Dockerfile -Encoding utf8
}

# Step 4: 构建 Docker 镜像
Write-Host "[+] 构建 Docker 镜像..."
docker build -t mall4cloud-gateway-app .

if ($LASTEXITCODE -ne 0) {
    Write-Error "[!] Docker 构建失败"
    exit 1
}

# Step 5: 停止并删除旧容器（如有）
Write-Host "[+] 停止并删除旧容器（如存在）..."
docker rm -f mall4cloud-gateway 2>&1 | Out-Null

# Step 6: 启动新容器
Write-Host "[+] 启动网关容器..."
docker run -d `
  --name mall4cloud-gateway `
  -p 8080:8080 `
  -e NACOS_HOST=192.168.3.13 `
  -e NACOS_PORT=8848 `
  -e SEATA_HOST=192.168.3.13 `
  -e SEATA_PORT=8091 `
  mall4cloud-gateway-app

# Step 7: 查看日志
Write-Host "[+] 正在输出日志..."
docker logs -f mall4cloud-gateway