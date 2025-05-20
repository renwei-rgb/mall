# 导入配置到 Nacos
$nacosAddr = "192.168.1.46:8848"
$namespace = ""  # 默认命名空间
$username = "nacos"
$password = "nacos"

# 配置文件列表
$configs = @(
    @{
        "dataId" = "mall4cloud-auth.yaml"
        "group" = "DEFAULT_GROUP"
        "file" = "mall4cloud-auth.yaml"
    },
    @{
        "dataId" = "mall4cloud-platform.yaml"
        "group" = "DEFAULT_GROUP"
        "file" = "mall4cloud-platform.yaml"
    },
    @{
        "dataId" = "mall4cloud-biz.yaml"
        "group" = "DEFAULT_GROUP"
        "file" = "mall4cloud-biz.yaml"
    },
    @{
        "dataId" = "mall4cloud-gateway.yaml"
        "group" = "DEFAULT_GROUP"
        "file" = "mall4cloud-gateway.yaml"
    },
    @{
        "dataId" = "mall4cloud-common.yaml"
        "group" = "DEFAULT_GROUP"
        "file" = "mall4cloud-common.yaml"
    },
    @{
        "dataId" = "seata.properties"
        "group" = "SEATA_GROUP"
        "file" = "seata.properties"
    }
)

# 获取登录token
$loginUrl = "http://$nacosAddr/nacos/v1/auth/login"
$loginBody = @{
    username = $username
    password = $password
}
$loginResponse = Invoke-RestMethod -Uri $loginUrl -Method Post -Body $loginBody

foreach ($config in $configs) {
    $content = Get-Content -Path "D:\tss-project\b2c\mall4cloud\nacos-config\$($config.file)" -Raw
    $configUrl = "http://$nacosAddr/nacos/v1/cs/configs"
    
    $configBody = @{
        dataId = $config.dataId
        group = $config.group
        content = $content
        type = if ($config.file -like "*.yaml") { "yaml" } else { "properties" }
    }
    
    try {
        $response = Invoke-RestMethod -Uri $configUrl -Method Post -Body $configBody -Headers @{
            "Authorization" = $loginResponse.accessToken
        }
        Write-Host "Uploaded $($config.dataId) to group $($config.group): $response"
    }
    catch {
        Write-Host "Failed to upload $($config.dataId): $_"
    }
}
