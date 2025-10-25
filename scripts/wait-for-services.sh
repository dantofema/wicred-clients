#!/bin/sh
set -eu

# Espera a que un host:puerto acepte conexiones TCP usando PHP
wait_for() {
  HOST="$1"
  PORT="$2"
  echo "Waiting for $HOST:$PORT..."
  # Intentos ilimitados (local dev); salirá cuando se pueda conectar
  while true; do
    # comprobación rápida con PHP (estará disponible en la imagen sail)
    php -r "\$s=@fsockopen('$HOST',$PORT,\$e,\$es,1); if (is_resource(\$s)) { fclose(\$s); exit(0); } exit(1);" >/dev/null 2>&1 && break
    sleep 1
  done
  echo "$HOST:$PORT is ready"
}

# Servicios a esperar (puedes añadir más si es necesario)
wait_for mariadb 3306
wait_for redis 6379

# Finalmente, ejecutar el comando original del contenedor
exec start-container

