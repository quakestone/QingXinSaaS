#!/bin/sh

# 复制项目的文件到对应docker路径，便于一键生成镜像。
usage() {
	echo "Usage: sh copy.sh"
	exit 1
}


# copy sql
echo "begin copy sql "
cp ../sql/ry_20240629.sql ./mysql/db
cp ../sql/ry_config_20240902.sql ./mysql/db

# copy html
echo "begin copy html "
cp -r ../qingxinsaas-ui/dist/** ./nginx/html/dist


# copy jar
echo "begin copy qingxinsaas-gateway "
cp ../qingxinsaas-gateway/target/qingxinsaas-gateway.jar ./ruoyi/gateway/jar

echo "begin copy qingxinsaas-auth "
cp ../qingxinsaas-auth/target/qingxinsaas-auth.jar ./ruoyi/auth/jar

echo "begin copy qingxinsaas-visual "
cp ../qingxinsaas-visual/qingxinsaas-monitor/target/qingxinsaas-visual-monitor.jar  ./ruoyi/visual/monitor/jar

echo "begin copy qingxinsaas-modules-system "
cp ../qingxinsaas-modules/qingxinsaas-system/target/qingxinsaas-modules-system.jar ./ruoyi/modules/system/jar

echo "begin copy qingxinsaas-modules-file "
cp ../qingxinsaas-modules/qingxinsaas-file/target/qingxinsaas-modules-file.jar ./ruoyi/modules/file/jar

echo "begin copy qingxinsaas-modules-job "
cp ../qingxinsaas-modules/qingxinsaas-job/target/qingxinsaas-modules-job.jar ./ruoyi/modules/job/jar

echo "begin copy qingxinsaas-modules-gen "
cp ../qingxinsaas-modules/qingxinsaas-gen/target/qingxinsaas-modules-gen.jar ./ruoyi/modules/gen/jar

