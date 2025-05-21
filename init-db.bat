@echo off
chcp 65001
echo [32m正在初始化数据库...[0m

REM 设置MySQL连接信息
set MYSQL_HOST=localhost
set MYSQL_PORT=3306
set MYSQL_USER=root
set MYSQL_PASSWORD=rw123

REM 创建数据库
echo [32m创建数据库...[0m
mysql -h%MYSQL_HOST% -P%MYSQL_PORT% -u%MYSQL_USER% -p%MYSQL_PASSWORD% --default-character-set=utf8mb4 -e "CREATE DATABASE IF NOT EXISTS mall4cloud_auth DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;" 2>nul
mysql -h%MYSQL_HOST% -P%MYSQL_PORT% -u%MYSQL_USER% -p%MYSQL_PASSWORD% --default-character-set=utf8mb4 -e "CREATE DATABASE IF NOT EXISTS mall4cloud_biz DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;" 2>nul
mysql -h%MYSQL_HOST% -P%MYSQL_PORT% -u%MYSQL_USER% -p%MYSQL_PASSWORD% --default-character-set=utf8mb4 -e "CREATE DATABASE IF NOT EXISTS mall4cloud_leaf DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;" 2>nul
mysql -h%MYSQL_HOST% -P%MYSQL_PORT% -u%MYSQL_USER% -p%MYSQL_PASSWORD% --default-character-set=utf8mb4 -e "CREATE DATABASE IF NOT EXISTS mall4cloud_multishop DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;" 2>nul
mysql -h%MYSQL_HOST% -P%MYSQL_PORT% -u%MYSQL_USER% -p%MYSQL_PASSWORD% --default-character-set=utf8mb4 -e "CREATE DATABASE IF NOT EXISTS mall4cloud_order DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;" 2>nul
mysql -h%MYSQL_HOST% -P%MYSQL_PORT% -u%MYSQL_USER% -p%MYSQL_PASSWORD% --default-character-set=utf8mb4 -e "CREATE DATABASE IF NOT EXISTS mall4cloud_payment DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;" 2>nul
mysql -h%MYSQL_HOST% -P%MYSQL_PORT% -u%MYSQL_USER% -p%MYSQL_PASSWORD% --default-character-set=utf8mb4 -e "CREATE DATABASE IF NOT EXISTS mall4cloud_platform DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;" 2>nul
mysql -h%MYSQL_HOST% -P%MYSQL_PORT% -u%MYSQL_USER% -p%MYSQL_PASSWORD% --default-character-set=utf8mb4 -e "CREATE DATABASE IF NOT EXISTS mall4cloud_product DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;" 2>nul
mysql -h%MYSQL_HOST% -P%MYSQL_PORT% -u%MYSQL_USER% -p%MYSQL_PASSWORD% --default-character-set=utf8mb4 -e "CREATE DATABASE IF NOT EXISTS mall4cloud_rbac DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;" 2>nul
mysql -h%MYSQL_HOST% -P%MYSQL_PORT% -u%MYSQL_USER% -p%MYSQL_PASSWORD% --default-character-set=utf8mb4 -e "CREATE DATABASE IF NOT EXISTS mall4cloud_user DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;" 2>nul

REM 导入数据
echo [32m导入数据...[0m
mysql -h%MYSQL_HOST% -P%MYSQL_PORT% -u%MYSQL_USER% -p%MYSQL_PASSWORD% --default-character-set=utf8mb4 mall4cloud_auth < db\mall4cloud_auth.sql 2>nul
mysql -h%MYSQL_HOST% -P%MYSQL_PORT% -u%MYSQL_USER% -p%MYSQL_PASSWORD% --default-character-set=utf8mb4 mall4cloud_biz < db\mall4cloud_biz.sql 2>nul
mysql -h%MYSQL_HOST% -P%MYSQL_PORT% -u%MYSQL_USER% -p%MYSQL_PASSWORD% --default-character-set=utf8mb4 mall4cloud_leaf < db\mall4cloud_leaf.sql 2>nul
mysql -h%MYSQL_HOST% -P%MYSQL_PORT% -u%MYSQL_USER% -p%MYSQL_PASSWORD% --default-character-set=utf8mb4 mall4cloud_multishop < db\mall4cloud_multishop.sql 2>nul
mysql -h%MYSQL_HOST% -P%MYSQL_PORT% -u%MYSQL_USER% -p%MYSQL_PASSWORD% --default-character-set=utf8mb4 mall4cloud_order < db\mall4cloud_order.sql 2>nul
mysql -h%MYSQL_HOST% -P%MYSQL_PORT% -u%MYSQL_USER% -p%MYSQL_PASSWORD% --default-character-set=utf8mb4 mall4cloud_payment < db\mall4cloud_payment.sql 2>nul
mysql -h%MYSQL_HOST% -P%MYSQL_PORT% -u%MYSQL_USER% -p%MYSQL_PASSWORD% --default-character-set=utf8mb4 mall4cloud_platform < db\mall4cloud_platform.sql 2>nul
mysql -h%MYSQL_HOST% -P%MYSQL_PORT% -u%MYSQL_USER% -p%MYSQL_PASSWORD% --default-character-set=utf8mb4 mall4cloud_product < db\mall4cloud_product.sql 2>nul
mysql -h%MYSQL_HOST% -P%MYSQL_PORT% -u%MYSQL_USER% -p%MYSQL_PASSWORD% --default-character-set=utf8mb4 mall4cloud_rbac < db\mall4cloud_rbac.sql 2>nul
mysql -h%MYSQL_HOST% -P%MYSQL_PORT% -u%MYSQL_USER% -p%MYSQL_PASSWORD% --default-character-set=utf8mb4 mall4cloud_user < db\mall4cloud_user.sql 2>nul
mysql -h%MYSQL_HOST% -P%MYSQL_PORT% -u%MYSQL_USER% -p%MYSQL_PASSWORD% --default-character-set=utf8mb4 mall4cloud_user < db\mall4cloud_user_area_data.sql 2>nul

echo [32m数据库初始化完成！[0m
pause 