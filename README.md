# Wicred Clients

Aplicación Laravel modular con Livewire para gestión de clientes.

## 🚀 Configuración del Proyecto

### Requisitos

- PHP 8.4+
- Laravel 12
- Node.js & npm
- Composer

### Instalación

```bash
# Instalar dependencias
composer install
npm install

# Configurar entorno
cp .env.example .env
php artisan key:generate

# Migrar base de datos
php artisan migrate

# Compilar assets
npm run build
```

## 🤖 GitHub Copilot & MCP Server

Este proyecto incluye configuración para el MCP Server de Laravel Boost, que proporciona herramientas poderosas a GitHub Copilot en PHPStorm.

**Para configurar GitHub Copilot con MCP**, consulta la documentación detallada:

📖 **[Guía de configuración MCP Server](.github/MCP-SERVER.md)**

### Verificar configuración MCP

```bash
./scripts/verify-mcp.sh
```

## 🏗️ Estructura del Proyecto

Este proyecto usa Laravel Modules para una arquitectura modular:

```
Modules/
├── Front/           # Módulo frontend principal
│   ├── app/
│   ├── resources/
│   ├── routes/
│   └── tests/
```

## 🛠️ Desarrollo

### Servidor de desarrollo

```bash
# Opción 1: Todos los servicios (recomendado)
composer run dev

# Opción 2: Solo servidor web
php artisan serve
```

### Testing

```bash
# Ejecutar todos los tests
php artisan test

# Ejecutar tests específicos
php artisan test tests/Feature/ExampleTest.php

# Con cobertura
composer run test:coverage
```

### Code Quality

```bash
# Formatear código (Laravel Pint)
composer run pint

# Análisis estático (PHPStan)
composer run phpstan

# Refactoring automático (Rector)
composer run rector
```

## 📦 Stack Tecnológico

- **Framework**: Laravel 12
- **Frontend**: Livewire 3 + Volt
- **Styling**: Tailwind CSS 4
- **Testing**: Pest 4
- **Code Quality**: Pint, PHPStan, Rector
- **Database**: MariaDB
- **Módulos**: nwidart/laravel-modules

## 📝 Convenciones de Código

Este proyecto sigue las [Laravel Boost Guidelines](.github/copilot-instructions.md) y las mejores prácticas de Laravel.

- PHP 8.4+ con type hints estrictos
- Constructor property promotion
- Pest para testing
- Form Requests para validación
- Eloquent relationships con type hints
- Tailwind CSS para estilos

## 🤝 Contribuir

1. Sigue las convenciones del código existente
2. Escribe tests para nuevas funcionalidades
3. Ejecuta `composer run pint` antes de commits
4. Verifica que todos los tests pasen

## 📄 Licencia

Este proyecto es propietario y confidencial.

