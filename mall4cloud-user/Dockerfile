FROM openjdk:17-jdk-slim
WORKDIR /app
COPY target/mall4cloud-user.jar app.jar
ENV TZ=Asia/Shanghai
EXPOSE 9000
ENTRYPOINT ["java", "-jar", "app.jar"] 