#!/usr/bin/python3

# Pongo a disposición pública este script bajo el término de "software de dominio público".
# Puedes hacer lo que quieras con él porque es libre de verdad; no libre con condiciones como las licencias GNU y otras patrañas similares.
# Si se te llena la boca hablando de libertad entonces hazlo realmente libre.
# No tienes que aceptar ningún tipo de términos de uso o licencia para utilizarlo o modificarlo porque va sin CopyLeft.

#-----------------------------------------------
#  Script de NiPeGun para leer el sensor DHT22
#-----------------------------------------------

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

    
