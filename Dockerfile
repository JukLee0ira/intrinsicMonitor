# 使用官方的 InfluxDB 镜像
FROM influxdb:1.8

# 设置 InfluxDB 的配置
COPY influxdb.conf /etc/influxdb/influxdb.conf

# 暴露 InfluxDB 的端口
EXPOSE 8086

# 启动 InfluxDB
CMD ["influxd", "-config", "/etc/influxdb/influxdb.conf"]

# 使用官方的 Grafana 镜像
FROM grafana/grafana:latest

# 暴露 Grafana 的端口
EXPOSE 3000