-- Crear la base de datos bd_datos si no existe
CREATE DATABASE IF NOT EXISTS bd_datos CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Nota: El GRANT se ejecuta desde un script .sh separado para permitir la expansión de variables de entorno.
