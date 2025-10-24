# 🚀 Guía Rápida: Configurar GitHub Copilot con MCP en 5 minutos

Esta guía te ayudará a configurar el MCP Server de Laravel Boost para mejorar GitHub Copilot en PHPStorm.

## ¿Qué es esto?

El MCP (Model Context Protocol) Server de Laravel Boost da superpoderes a GitHub Copilot, permitiéndole:

- 🔍 Buscar documentación específica de Laravel/Livewire
- 🎯 Ejecutar comandos Artisan
- 🗄️ Consultar la base de datos
- 🧪 Ejecutar código en Tinker
- 🌐 Generar URLs correctas
- 📊 Y más...

## ⚡ Configuración Rápida (PHPStorm)

### Paso 1: Verificar instalación

```bash
./scripts/verify-mcp.sh
```

Si ves ✅ en todo, continúa al Paso 2.

### Paso 2: Configurar en PHPStorm

1. Abre **Settings** (Ctrl+Alt+S / Cmd+,)
2. Ve a: **Tools → GitHub Copilot**
3. Busca la sección **MCP Servers** (puede estar en una pestaña o subsección)
4. Haz clic en **+** para agregar un servidor
5. Copia y pega esta configuración:

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

6. Haz clic en **OK** y cierra Settings
7. **Reinicia PHPStorm**

### Paso 3: Verificar que funciona

1. Abre GitHub Copilot Chat en PHPStorm
2. Escribe: "Lista los comandos artisan disponibles"
3. Si Copilot responde con una lista de comandos, ¡funciona! 🎉

## 🆘 Troubleshooting

### "No veo la opción MCP Servers"

- Actualiza PHPStorm a la última versión
- Asegúrate de tener GitHub Copilot habilitado
- Verifica que tienes una suscripción activa de Copilot

### "El servidor no se conecta"

```bash
# Verifica que Laravel Boost está instalado
composer show laravel/boost

# Si no está instalado
composer require laravel/boost --dev

# Limpia la cache
php artisan config:clear

# Prueba el servidor manualmente
php artisan mcp:inspector
```

### "PHP no encontrado"

Asegúrate de que PHP está en tu PATH:

```bash
which php
php --version  # Debe ser 8.4+
```

## 🎯 Ejemplos de Uso

Una vez configurado, puedes pedirle a Copilot cosas como:

### Buscar documentación
```
"Busca la documentación de Livewire sobre wire:model.live"
"¿Cómo uso form requests en Laravel 12?"
"Muéstrame ejemplos de testing con Pest 4"
```

### Ejecutar comandos
```
"Lista todos los comandos artisan disponibles"
"Crea un modelo User con factory y migration"
"Ejecuta las migraciones pendientes"
```

### Consultar datos
```
"¿Cuántos usuarios hay en la base de datos?"
"Muéstrame los últimos 5 productos creados"
```

### Generar código
```
"Crea un test para el login"
"Genera una migración para agregar email_verified a users"
```

## 📚 Documentación Completa

- **Configuración detallada**: [MCP-SERVER.md](MCP-SERVER.md)
- **Otros editores**: [MCP-EDITOR-EXAMPLES.md](MCP-EDITOR-EXAMPLES.md)
- **Seguridad**: [MCP-SECURITY-FAQ.md](MCP-SECURITY-FAQ.md)

## ✅ Checklist Final

- [ ] Ejecuté `./scripts/verify-mcp.sh` y todo está ✅
- [ ] Configuré MCP en PHPStorm siguiendo el Paso 2
- [ ] Reinicié PHPStorm
- [ ] Probé GitHub Copilot Chat y funciona
- [ ] Leí las mejores prácticas en MCP-SERVER.md

## 🤝 Ayuda

Si tienes problemas:

1. Revisa la documentación completa en los archivos `.github/MCP-*.md`
2. Ejecuta `./scripts/verify-mcp.sh` para diagnosticar
3. Consulta con el equipo en Slack/Discord

---

**¿Listo?** ¡Comienza con el Paso 1! ⬆️

