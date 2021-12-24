#!/bin/bash

# Pongo a disposición pública este script bajo el término de "software de dominio público".
# Puedes hacer lo que quieras con él porque es libre de verdad; no libre con condiciones como las licencias GNU y otras patrañas similares.
# Si se te llena la boca hablando de libertad entonces hazlo realmente libre.
# No tienes que aceptar ningún tipo de términos de uso o licencia para utilizarlo o modificarlo porque va sin CopyLeft.

#-----------------------------------------------------------------------------------------------------
#  Script de NiPeGun para crear el servicio para los scripts de lectura del sensor DHT22 para Debian
#-----------------------------------------------------------------------------------------------------

## Crear el servicio de lectura y guardado
   echo "[Unit]"                                                                     > /etc/systemd/system/DHT22.service
   echo "Description=Servicio de SystemD para el sensor DHT22"                      >> /etc/systemd/system/DHT22.service
   echo "[Service]"                                                                 >> /etc/systemd/system/DHT22.service
   echo "ExecStart=/usr/bin/python3 /home/pi/SensorDHT22-LeerYGuardarEnInfluxDB.py" >> /etc/systemd/system/DHT22.service
   echo "[Install]"                                                                 >> /etc/systemd/system/DHT22.service
   echo "WantedBy=default.target"                                                   >> /etc/systemd/system/DHT22.service

## Crear el servicio de temporizador para disparar el servicio de lectura y guardado
   echo "[Unit]"                                         > /etc/systemd/system/DHT22.timer
   echo "Description=Temporizador para el sensor DHT22" >> /etc/systemd/system/DHT22.timer
   echo "[Timer]"                                       >> /etc/systemd/system/DHT22.timer
   echo "OnCalendar=*-*-* *:*:00"                       >> /etc/systemd/system/DHT22.timer
   echo "[Install]"                                     >> /etc/systemd/system/DHT22.timer
   echo "WantedBy=default.target"                       >> /etc/systemd/system/DHT22.timer

   systemctl enable DHT22.service
   systemctl enable DHT22.timer
   systemctl start  DHT22.service
   systemctl start  DHT22.timer
   
   
