# FAQ: Seguridad del MCP Server

## ¿Es seguro compartir la configuración del MCP en el repositorio?

**Sí, es completamente seguro.** La configuración del MCP Server de Laravel Boost NO contiene información sensible.

## ¿Qué contiene la configuración?

La configuración únicamente especifica:
- El comando para ejecutar (`php artisan boost:mcp`)
- Variables de entorno genéricas (`APP_ENV=local`)
- Rutas relativas al proyecto

## ¿Qué NO contiene?

❌ Contraseñas de base de datos
❌ API keys o tokens
❌ Secretos de aplicación
❌ Información de producción
❌ Datos de usuarios
❌ Credenciales de servicios externos

## ¿Cómo funciona la seguridad?

1. **Ejecución local**: El MCP server solo se ejecuta en tu máquina local
2. **Lee del .env**: Usa tu archivo `.env` local que NO está versionado
3. **Sin conexiones externas**: No envía datos fuera de tu máquina
4. **Contexto de desarrollo**: Solo funciona en entorno local (`APP_ENV=local`)

## ¿Qué archivos SÍ debo proteger?

Estos archivos NUNCA deben estar en el repositorio (ya están en `.gitignore`):

```
/.env                    # Contiene credenciales reales
/.env.backup
/.env.production
/auth.json              # Credenciales de Composer
/.phpactor.json
```

## ¿Cómo Laravel Boost protege la información?

Laravel Boost está diseñado por el equipo de Laravel con seguridad en mente:

1. **Lectura de configuración**: Lee desde archivos de configuración de Laravel (que ya usan `.env`)
2. **No expone secretos**: Las herramientas no exponen directamente valores del `.env`
3. **Filtrado automático**: Filtra automáticamente información sensible
4. **Solo desarrollo**: Está diseñado para entornos de desarrollo

## ¿Qué hace cada herramienta del MCP?

### `list-artisan-commands`
- Lista comandos disponibles de artisan
- **No expone**: Datos sensibles, solo nombres de comandos

### `run-artisan-command`
- Ejecuta comandos artisan en tu máquina local
- **No expone**: Credenciales, solo resultados del comando

### `tinker`
- Ejecuta código PHP en tu entorno local
- **No expone**: El código se ejecuta localmente con tu `.env`

### `database-query`
- Consulta la base de datos local
- **No expone**: Usa tu configuración local de DB

### `search-docs`
- Busca documentación oficial de Laravel/Livewire/etc.
- **No expone**: Nada, solo busca documentación pública

### `get-absolute-url`
- Genera URLs usando tu configuración local
- **No expone**: Solo genera URLs basadas en `APP_URL`

### `browser-logs`
- Lee logs del navegador (si están disponibles)
- **No expone**: Solo logs del navegador, no del servidor

## ¿Puedo usar esto en producción?

**NO.** El MCP Server de Laravel Boost es exclusivamente para desarrollo:

- Está en las dependencias `require-dev` de Composer
- No se instala en producción con `composer install --no-dev`
- Requiere `APP_ENV=local` para funcionar
- Las herramientas están diseñadas para debugging y desarrollo

## ¿Qué pasa si alguien clona el repositorio?

Si alguien clona el repositorio:

1. ✅ Obtienen la configuración del MCP (segura)
2. ✅ NO obtienen tu archivo `.env` (protegido por `.gitignore`)
3. ✅ NO obtienen acceso a tu base de datos
4. ✅ NO obtienen tus credenciales
5. ✅ Pueden configurar su propio entorno local

## Mejores prácticas adicionales

### ✅ HACER:
- Compartir la configuración del MCP en el repo
- Usar `.env` para todas las credenciales
- Mantener `.env` en `.gitignore`
- Usar `APP_ENV=local` en la configuración del MCP
- Documentar la configuración para el equipo

### ❌ NO HACER:
- Poner credenciales en archivos de configuración
- Hardcodear API keys en el código
- Compartir archivos `.env`
- Usar `APP_ENV=production` en el MCP
- Commitear archivos con secretos

## ¿Cómo verifico que no estoy exponiendo información?

```bash
# Verifica qué archivos están siendo trackeados
git status

# Verifica el contenido de la configuración MCP
cat .github/copilot-mcp.json
cat .mcp.json

# Verifica que .env NO está en git
git ls-files | grep .env  # No debería devolver nada

# Verifica el .gitignore
cat .gitignore | grep .env  # Debe mostrar .env
```

## Recursos adicionales

- [Laravel Environment Configuration](https://laravel.com/docs/12.x/configuration#environment-configuration)
- [Laravel Boost Documentation](https://github.com/laravel/boost)
- [MCP Protocol Security](https://modelcontextprotocol.io/docs/concepts/security)

## ¿Aún tienes dudas?

Si tienes preguntas sobre seguridad:

1. Revisa qué archivos están en `.gitignore`
2. Verifica que `.env` NO está versionado
3. Inspecciona el contenido de los archivos de configuración del MCP
4. Consulta con el equipo de seguridad si trabajas en un proyecto empresarial

## Resumen

✅ **Configuración del MCP = SEGURA para compartir**
❌ **Archivo .env = NUNCA compartir**

La configuración del MCP es como un "manual de instrucciones" sobre cómo ejecutar herramientas. No contiene las "llaves" (credenciales) que hacen que esas herramientas accedan a datos sensibles.

