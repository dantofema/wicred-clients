#!/bin/bash
set -euo pipefail

# Este script se ejecuta por el entrypoint de MariaDB durante la inicialización
# Usa variables de entorno definidas en el compose: MYSQL_ROOT_PASSWORD, MYSQL_USER, MYSQL_DATABASE

: "${MYSQL_ROOT_PASSWORD:?MYSQL_ROOT_PASSWORD is required}"
: "${MYSQL_USER:?MYSQL_USER is required}"
: "${MYSQL_DATABASE:?MYSQL_DATABASE is required}"

# Esperar a que el servidor MySQL temporal acepte conexiones a localhost
for i in {1..30}; do
  if mysql -uroot -p"${MYSQL_ROOT_PASSWORD}" -e "SELECT 1" >/dev/null 2>&1; then
    break
  fi
  echo "Waiting for MariaDB server... ($i)"
  sleep 1
done

# Ejecutar GRANT usando el usuario root con contraseña
mysql -uroot -p"${MYSQL_ROOT_PASSWORD}" <<SQL
GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';
FLUSH PRIVILEGES;
SQL

echo "Grants applied for ${MYSQL_USER} on ${MYSQL_DATABASE}"

