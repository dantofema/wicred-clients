# Configuración MCP Server para GitHub Copilot

Este proyecto incluye la configuración del MCP (Model Context Protocol) Server de Laravel Boost para mejorar la experiencia con GitHub Copilot en PHPStorm.

## ¿Qué es Laravel Boost MCP?

Laravel Boost es un servidor MCP que proporciona herramientas poderosas a GitHub Copilot para trabajar mejor con tu aplicación Laravel:

- **Artisan Commands**: Lista y ejecuta comandos artisan
- **Tinker**: Ejecuta código PHP directamente
- **Database Query**: Consulta la base de datos
- **Browser Logs**: Lee logs del navegador
- **Documentation Search**: Busca documentación específica de versión
- **URL Generation**: Genera URLs absolutas correctas

## Configuración en PHPStorm

### Opción 1: Usando el archivo compartido del proyecto

1. Copia el contenido de `.github/copilot-mcp.json` 
2. En PHPStorm, ve a: **Settings → Tools → GitHub Copilot → MCP Servers**
3. Agrega una nueva configuración usando el contenido del archivo

### Opción 2: Configuración manual

Agrega esta configuración en la configuración de MCP de PHPStorm:

```json
{
  "mcpServers": {
    "laravel-boost": {
      "command": "php",
      "args": [
        "${workspaceFolder}/artisan",
        "boost:mcp"
      ],
      "cwd": "${workspaceFolder}",
      "env": {
        "APP_ENV": "local"
      }
    }
  }
}
```

## ¿Es seguro compartir esta configuración?

**Sí, es completamente seguro** por las siguientes razones:

1. ✅ **No contiene credenciales**: La configuración solo indica cómo ejecutar el comando artisan
2. ✅ **No expone datos sensibles**: No incluye información de la base de datos, API keys, o secretos
3. ✅ **Solo ejecución local**: El servidor MCP solo se ejecuta en tu máquina local
4. ✅ **Variables de entorno**: Usa `APP_ENV=local` que lee desde tu `.env` local (no versionado)
5. ✅ **Beneficio del equipo**: Todo el equipo puede usar la misma configuración

## Verificar la instalación

Para verificar que el MCP server está funcionando correctamente:

```bash
# Verificar que Laravel Boost está instalado
composer show laravel/boost

# Probar el servidor MCP
php artisan mcp:inspector
```

## Requisitos

- Laravel Boost instalado (ya incluido en `composer.json` dev dependencies)
- PHPStorm con GitHub Copilot habilitado
- PHP 8.4+

## Herramientas disponibles

Una vez configurado, GitHub Copilot tendrá acceso a:

- `list-artisan-commands`: Listar comandos artisan disponibles
- `run-artisan-command`: Ejecutar comandos artisan
- `tinker`: Ejecutar código PHP en tinker
- `database-query`: Consultar la base de datos
- `search-docs`: Buscar documentación específica de Laravel/Livewire/etc.
- `get-absolute-url`: Generar URLs absolutas
- `browser-logs`: Leer logs del navegador (si están disponibles)

## Troubleshooting

Si el MCP server no funciona:

1. Verifica que Laravel Boost esté instalado: `composer require laravel/boost --dev`
2. Limpia la cache: `php artisan config:clear`
3. Reinicia PHPStorm
4. Verifica los logs en PHPStorm: **Help → Show Log in Finder/Explorer**

## Más información

- [Laravel Boost Documentation](https://github.com/laravel/boost)
- [MCP Protocol](https://modelcontextprotocol.io/)

