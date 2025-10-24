# Ejemplos de Configuración MCP para Diferentes Editores

## VS Code / Cursor

Crea o edita `~/.config/Code/User/globalStorage/github.copilot-chat/config.json` (o equivalente para Cursor):

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

## PHPStorm

### Método 1: Configuración de Copilot MCP

1. Ve a **Settings → Tools → GitHub Copilot → MCP Servers**
2. Haz clic en el botón **+** para agregar un nuevo servidor
3. Nombre: `laravel-boost`
4. Command: `php`
5. Arguments: `artisan boost:mcp`
6. Working Directory: Raíz del proyecto
7. Environment Variables: `APP_ENV=local`

### Método 2: Importar desde archivo

1. Copia el contenido de `.github/copilot-mcp.json`
2. Pégalo en la configuración de MCP Servers de PHPStorm

## Zed Editor

En el archivo de configuración de Zed (`~/.config/zed/settings.json`):

```json
{
  "mcp_servers": {
    "laravel-boost": {
      "command": "php",
      "args": ["artisan", "boost:mcp"],
      "env": {
        "APP_ENV": "local"
      }
    }
  }
}
```

## Claude Desktop (si lo usas)

En `~/Library/Application Support/Claude/claude_desktop_config.json` (macOS) o 
`%APPDATA%\Claude\claude_desktop_config.json` (Windows):

```json
{
  "mcpServers": {
    "laravel-boost": {
      "command": "php",
      "args": ["artisan", "boost:mcp"],
      "cwd": "/ruta/completa/al/proyecto/wicred-clients",
      "env": {
        "APP_ENV": "local"
      }
    }
  }
}
```

## Notas Importantes

### Variables de Entorno

Todas las configuraciones usan `APP_ENV=local` para asegurar que:
- Se usa la configuración local de `.env`
- No se exponen datos de producción
- Las herramientas funcionan en modo desarrollo

### Rutas Absolutas vs Relativas

- `${workspaceFolder}` es una variable que se resuelve automáticamente en la mayoría de editores
- Si tu editor no soporta esta variable, usa la ruta absoluta al proyecto
- Para PHPStorm, la ruta se resuelve automáticamente desde el contexto del proyecto

### Verificación

Para verificar que la configuración funciona:

```bash
# Test manual del servidor MCP
php artisan boost:mcp

# O usa el inspector
php artisan mcp:inspector
```

### Troubleshooting

Si el MCP server no aparece o no funciona:

1. **Verifica la ruta**: Asegúrate de que `php` está en tu PATH
2. **Permisos**: El script debe tener permisos de ejecución
3. **Laravel Boost**: Debe estar instalado (`composer show laravel/boost`)
4. **Reinicia el editor**: A veces necesita reiniciarse para cargar la configuración
5. **Logs**: Revisa los logs del editor para errores específicos

### Seguridad

✅ **Seguro para compartir**: Esta configuración no contiene:
- Contraseñas o API keys
- Datos de base de datos
- Información sensible del proyecto

❌ **NO compartas**: Tu archivo `.env` que contiene credenciales reales

