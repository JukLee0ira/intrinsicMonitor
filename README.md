## Introduction
This is a tool for monitoring XDC network nodes. It uses InfluxDB to store metric data and provides a visual interface through Grafana. With this tool, you can monitor the performance, health status, and other internal metrics of the nodes in real-time.

## Quick Start

### Installation Steps

1. Clone the repository:
```bash
git clone https://github.com/XinFinOrg/XDCMonitor
cd XDCMonitor
```

2. Start the service:
```bash
docker compose up -d
```

3. Access the monitoring interface:
   - Open your browser and go to: `http://localhost:3000`
   - Default login credentials:
     - Username: admin
     - Password: admin
   - Please change your password immediately after the first login.

#### Grafana Data Source Configuration

After successfully logging into Grafana, you need to configure the InfluxDB data source to display monitoring data:

1. **Add Data Source**
   - Click the ⚙️ icon (Configuration) in the left menu.
   - Select "Data sources."
   - Click "Add data source."
   - Choose "InfluxDB."

2. **Configure Data Source Parameters**
   - Basic Information:
     - Name: `InfluxDB` (can be customized)
     - Query Language: select `InfluxQL`
   
   - HTTP Configuration:
     - URL: `http://influxdb:8086` (for local deployment) or `http://your-ip:8086` (for remote deployment)
     - Access: select `Server (Default)`

   - InfluxDB Detailed Configuration:
     - Database: `xdc` (should match the environment variable INFLUXDB_DB)
     - User: `xdc` (should match the environment variable INFLUXDB_USER)
     - Password: `xdc` (should match the environment variable INFLUXDB_PASSWORD)
     - HTTP Method: select `GET`

3. **Verify Connection**
   - After completing the configuration, click the "Save & test" button at the bottom of the page.
   - If the configuration is correct, you will see a green success message.
   - If there is an error, please check:
     - If the InfluxDB service is running properly.
     - If the database name, username, and password are correct.
     - If the URL is accessible.

#### Node Configuration
If you need to monitor your own node, please add the following configuration to the node startup parameters:
```bash
--metrics \
--metrics-influxdb \
--metrics-influxdb.database "xdc" \
--metrics-influxdb.username "xdc" \
--metrics-influxdb.password "xdc" \
--metrics-influxdb.endpoint "http://your-ip:8086"
```

Once everything is configured, you should see the following effect:
![Example Image](<Pasted image 20250314202319.png>)


