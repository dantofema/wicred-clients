-- Crear las bases de datos si no existen
CREATE DATABASE IF NOT EXISTS wicred_clients CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE DATABASE IF NOT EXISTS bd_datos CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE DATABASE IF NOT EXISTS wicred_clients_testing CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE DATABASE IF NOT EXISTS bd_datos_testing CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Nota: El GRANT se ejecuta desde un script .sh separado para permitir la expansión de variables de entorno.
