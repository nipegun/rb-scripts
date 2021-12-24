#!/usr/bin/python3

import Adafruit_DHT
import datetime
from influxdb import client as influxdb

# Base de datos
influxHost = xxx
influxPort = xxx
influxDB = xxx
influxUser = xxx
influxPasswd = xxx

# Sensor
DHT_SENSOR = Adafruit_DHT.DHT22
DHT_PIN = 4

# Crear el objeto del sensor usando el bus I2C de la Raspberry
humidity, temperature = Adafruit_DHT.read_retry(DHT_SENSOR, DHT_PIN)

# Mostrar la fecha en un formato agimable con influxDB 2017-02-26T13:33:49.00279827Z
current_time = datetime.datetime.utcnow().strftime('%Y-%m-%dT%H:%M:%SZ')

influx_metric = [{
"measurement": "temp_hum",
               "time": current_time,
               "fields":
                 {
                   "Temperatura": temperature,
                   "Humedad": humidity
                 }
}]

# Salvar los datos a la base de datos de InfluxDB
try:
  db = influxdb.InfluxDBClient(influxHost, influxPort, influxUser, InflusPasswd, InfluxDB)
  db.write_points(influx_metric)
finally:
  db.close()

