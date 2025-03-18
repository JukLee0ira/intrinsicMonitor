# use official influxdb image
FROM influxdb:1.8

# set influxdb config
COPY influxdb.conf /etc/influxdb/influxdb.conf

# expose influxdb port
EXPOSE 8086

# start influxdb
CMD ["influxd", "-config", "/etc/influxdb/influxdb.conf"]

# use official grafana image
FROM grafana/grafana:latest

# expose grafana port
EXPOSE 3000