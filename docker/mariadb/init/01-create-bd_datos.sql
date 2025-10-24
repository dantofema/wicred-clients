-- Crear la base de datos bd_datos si no existe
CREATE DATABASE IF NOT EXISTS bd_datos CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Otorgar permisos al usuario configurado
GRANT ALL PRIVILEGES ON bd_datos.* TO '${MYSQL_USER}'@'%';
FLUSH PRIVILEGES;

