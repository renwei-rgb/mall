FROM eclipse-temurin:17-jdk-alpine

# 设置工作目录
WORKDIR /app

# 复制 Maven 构建的 jar 文件
COPY target/mall4cloud-multishop.jar app.jar

# 暴露应用端口
EXPOSE 9103

# 设置时区
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# 启动命令
ENTRYPOINT ["java",\
            "-Djava.security.egd=file:/dev/./urandom",\
            "-Dspring.profiles.active=prod",\
            "-jar",\
            "app.jar"] 