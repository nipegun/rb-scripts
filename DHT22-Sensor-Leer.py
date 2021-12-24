#!/usr/bin/python3

import Adafruit_DHT
import json

DHT_SENSOR = Adafruit_DHT.DHT22
DHT_PIN = 4

while True:
  humidity, temperature = Adafruit_DHT.read_retry(DHT_SENSOR, DHT_PIN)
  if humidity is not None and temperature is not None:
    print(json.dumps({'Temperatura': temperature, 'Humedad': humidity}, indent=2))
  else:
    print("Falló la obtención de datos desde el sensor")

    
