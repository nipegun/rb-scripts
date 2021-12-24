#!/bin/bash

# Pongo a disposición pública este script bajo el término de "software de dominio público".
# Puedes hacer lo que quieras con él porque es libre de verdad; no libre con condiciones como las licencias GNU y otras patrañas similares.
# Si se te llena la boca hablando de libertad entonces hazlo realmente libre.
# No tienes que aceptar ningún tipo de términos de uso o licencia para utilizarlo o modificarlo porque va sin CopyLeft.

#------------------------------------------------------------------------
#  Script de NiPeGun para crear los scripts de lectura del sensor DHT22
#------------------------------------------------------------------------

echo ""
echo "  Creando el script de lectura simple..."
echo ""
## Creación del script que lee el sensor
   echo '#!/usr/bin/python3'                                                                  > /home/pi/DHT22-Sensor-Leer.py
   echo ''                                                                                   >> /home/pi/DHT22-Sensor-Leer.py
   echo 'import Adafruit_DHT'                                                                >> /home/pi/DHT22-Sensor-Leer.py
   echo 'import json'                                                                        >> /home/pi/DHT22-Sensor-Leer.py
   echo ''                                                                                   >> /home/pi/DHT22-Sensor-Leer.py
   echo 'DHT_SENSOR = Adafruit_DHT.DHT22'                                                    >> /home/pi/DHT22-Sensor-Leer.py
   echo 'DHT_PIN = 4'                                                                        >> /home/pi/DHT22-Sensor-Leer.py
   echo ''                                                                                   >> /home/pi/DHT22-Sensor-Leer.py
   echo 'while True:'                                                                        >> /home/pi/DHT22-Sensor-Leer.py
   echo '  humidity, temperature = Adafruit_DHT.read_retry(DHT_SENSOR, DHT_PIN)'             >> /home/pi/DHT22-Sensor-Leer.py
   echo '  if humidity is not None and temperature is not None:'                             >> /home/pi/DHT22-Sensor-Leer.py
   echo "    print(json.dumps({'Temperatura': temperature, 'Humedad': humidity}, indent=2))" >> /home/pi/DHT22-Sensor-Leer.py
   echo '  else:'                                                                            >> /home/pi/DHT22-Sensor-Leer.py
   echo '    print("Failed to retrieve data from humidity sensor")'                          >> /home/pi/DHT22-Sensor-Leer.py
   chmod +x /home/pi/DHT22-Sensor-Leer.py

echo ""
echo "  Creando el script de lectura simple..."
echo ""
## Creación del script que lee el sensor y guarda los datos en la base de datos
   echo '#!/usr/bin/python3'                                                                          > /home/pi/DHT22-Sensor-LeerYGuardarEnInfluxDB.py
   echo ''                                                                                           >> /home/pi/DHT22-Sensor-LeerYGuardarEnInfluxDB.py
   echo 'import Adafruit_DHT'                                                                        >> /home/pi/DHT22-Sensor-LeerYGuardarEnInfluxDB.py
   echo 'import datetime'                                                                            >> /home/pi/DHT22-Sensor-LeerYGuardarEnInfluxDB.py
   echo 'from influxdb import client as influxdb'                                                    >> /home/pi/DHT22-Sensor-LeerYGuardarEnInfluxDB.py
   echo ''                                                                                           >> /home/pi/DHT22-Sensor-LeerYGuardarEnInfluxDB.py
   echo '# Base de datos'                                                                            >> /home/pi/DHT22-Sensor-LeerYGuardarEnInfluxDB.py
   echo 'influxHost = xxx'                                                                           >> /home/pi/DHT22-Sensor-LeerYGuardarEnInfluxDB.py
   echo 'influxPort = xxx'                                                                           >> /home/pi/DHT22-Sensor-LeerYGuardarEnInfluxDB.py
   echo 'influxDB = xxx'                                                                             >> /home/pi/DHT22-Sensor-LeerYGuardarEnInfluxDB.py
   echo 'influxUser = xxx'                                                                           >> /home/pi/DHT22-Sensor-LeerYGuardarEnInfluxDB.py
   echo 'influxPasswd = xxx'                                                                         >> /home/pi/DHT22-Sensor-LeerYGuardarEnInfluxDB.py
   echo ''                                                                                           >> /home/pi/DHT22-Sensor-LeerYGuardarEnInfluxDB.py
   echo '# Sensor'                                                                                   >> /home/pi/DHT22-Sensor-LeerYGuardarEnInfluxDB.py
   echo 'DHT_SENSOR = Adafruit_DHT.DHT22'                                                            >> /home/pi/DHT22-Sensor-LeerYGuardarEnInfluxDB.py
   echo 'DHT_PIN = 4'                                                                                >> /home/pi/DHT22-Sensor-LeerYGuardarEnInfluxDB.py
   echo ''                                                                                           >> /home/pi/DHT22-Sensor-LeerYGuardarEnInfluxDB.py
   echo '# Crear el objeto del sensor usando el bus I2C de la Raspberry'                             >> /home/pi/DHT22-Sensor-LeerYGuardarEnInfluxDB.py
   echo 'humidity, temperature = Adafruit_DHT.read_retry(DHT_SENSOR, DHT_PIN)'                       >> /home/pi/DHT22-Sensor-LeerYGuardarEnInfluxDB.py
   echo ''                                                                                           >> /home/pi/DHT22-Sensor-LeerYGuardarEnInfluxDB.py
   echo '# Mostrar la fecha en un formato agimable con influxDB 2017-02-26T13:33:49.00279827Z'       >> /home/pi/DHT22-Sensor-LeerYGuardarEnInfluxDB.py
   echo "current_time = datetime.datetime.utcnow().strftime('%Y-%m-%dT%H:%M:%SZ')"                   >> /home/pi/DHT22-Sensor-LeerYGuardarEnInfluxDB.py
   echo ''                                                                                           >> /home/pi/DHT22-Sensor-LeerYGuardarEnInfluxDB.py
   echo 'influx_metric = [{'                                                                         >> /home/pi/DHT22-Sensor-LeerYGuardarEnInfluxDB.py
   echo '"measurement": "temp_hum",'                                                                 >> /home/pi/DHT22-Sensor-LeerYGuardarEnInfluxDB.py
   echo '               "time": current_time,'                                                       >> /home/pi/DHT22-Sensor-LeerYGuardarEnInfluxDB.py
   echo '               "fields":'                                                                   >> /home/pi/DHT22-Sensor-LeerYGuardarEnInfluxDB.py
   echo '                 {'                                                                         >> /home/pi/DHT22-Sensor-LeerYGuardarEnInfluxDB.py
   echo '                   "Temperatura": temperature,'                                             >> /home/pi/DHT22-Sensor-LeerYGuardarEnInfluxDB.py
   echo '                   "Humedad": humidity'                                                     >> /home/pi/DHT22-Sensor-LeerYGuardarEnInfluxDB.py
   echo '                 }'                                                                         >> /home/pi/DHT22-Sensor-LeerYGuardarEnInfluxDB.py
   echo '}]'                                                                                         >> /home/pi/DHT22-Sensor-LeerYGuardarEnInfluxDB.py
   echo ''                                                                                           >> /home/pi/DHT22-Sensor-LeerYGuardarEnInfluxDB.py
   echo '# Salvar los datos a la base de datos de InfluxDB'                                          >> /home/pi/DHT22-Sensor-LeerYGuardarEnInfluxDB.py
   echo 'try:'                                                                                       >> /home/pi/DHT22-Sensor-LeerYGuardarEnInfluxDB.py
   echo '  db = influxdb.InfluxDBClient(influxHost, influxPort, influxUser, InflusPasswd, InfluxDB)' >> /home/pi/DHT22-Sensor-LeerYGuardarEnInfluxDB.py
   echo '  db.write_points(influx_metric)'                                                           >> /home/pi/DHT22-Sensor-LeerYGuardarEnInfluxDB.py
   echo 'finally:'                                                                                   >> /home/pi/DHT22-Sensor-LeerYGuardarEnInfluxDB.py
   echo '  db.close()'                                                                               >> /home/pi/DHT22-Sensor-LeerYGuardarEnInfluxDB.py
   chmod +x /home/pi/DHT22-Sensor-LeerYGuardarEnInfluxDB.py

