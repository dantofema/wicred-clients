
Laravel Boost — Directrices AI (Lint & Code Quality)

Propósito:
Estas directrices instruyen a la IA sobre cómo usar las herramientas de análisis estático y formateo de código en este proyecto: Pint, Rector y Larastan, siguiendo las recomendaciones de Laravel.

=== PINT (Laravel Code Formatter) ===

Configuración del proyecto:
- Preset: "laravel"
- Exclusiones: vendor, storage, node_modules
- Archivo de configuración: pint.json

Reglas principales:
- SIEMPRE ejecutar Pint antes de finalizar cualquier cambio de código PHP.
- Usar el flag `--dirty` para formatear solo archivos modificados (más rápido).
- Ejecutar dentro de Sail: ./vendor/bin/sail pint --dirty
- NO usar el flag `--test` (solo formatea, no testea).

Comandos recomendados:
```zsh
# Formatear archivos modificados (recomendado antes de commit)
./vendor/bin/sail pint --dirty

# Formatear todo el proyecto
./vendor/bin/sail pint

# Formatear un archivo o directorio específico
./vendor/bin/sail pint app/Models
./vendor/bin/sail pint app/Models/User.php
```

Cuándo ejecutar Pint:
- Después de crear o modificar cualquier archivo PHP.
- Antes de hacer commit de cambios.
- Antes de ejecutar el comando `submit` para finalizar una tarea.
- Después de generar código mediante artisan make:*.

Buenas prácticas:
- Pint aplica automáticamente el estilo de código Laravel (PSR-12 con reglas adicionales).
- No personalices manualmente el formateo, deja que Pint lo maneje.
- Si Pint modifica archivos, revisa los cambios para asegurar que sean apropiados.

=== RECTOR (PHP Refactoring Tool) ===

Configuración del proyecto:
- PHP Version: 8.4
- Level Set: UP_TO_PHP_84 (actualizaciones seguras hasta PHP 8.4)
- Paths analizados: app, Modules, config, database, routes, tests
- Archivo de configuración: rector.php

Reglas principales:
- Rector automatiza refactorings y actualizaciones de código PHP.
- Aplica mejoras modernas de PHP 8.4 de forma segura.
- Ejecutar dentro de Sail: ./vendor/bin/sail php vendor/bin/rector

Comandos recomendados:
```zsh
# Analizar código y mostrar cambios propuestos (dry-run)
./vendor/bin/sail php vendor/bin/rector process --dry-run

# Aplicar refactorings automáticamente
./vendor/bin/sail php vendor/bin/rector process

# Procesar un directorio específico
./vendor/bin/sail php vendor/bin/rector process app/Models

# Procesar un archivo específico
./vendor/bin/sail php vendor/bin/rector process app/Models/User.php
```

Cuándo ejecutar Rector:
- Al actualizar código legacy o antiguo.
- Después de cambios significativos en la arquitectura.
- Periódicamente para mantener el código modernizado.
- Cuando se detecten patrones obsoletos en code reviews.

Buenas prácticas:
- Ejecutar primero con `--dry-run` para revisar cambios propuestos.
- Aplicar Rector antes de Pint (Rector refactoriza, Pint formatea).
- Revisar y testear después de aplicar cambios automáticos.
- No todos los cambios sugeridos por Rector son necesarios; usa criterio.

=== LARASTAN (PHPStan para Laravel) ===

Configuración del proyecto:
- Nivel: 5 (de 0 a 9, siendo 9 el más estricto)
- Paths analizados: app, database, routes, tests
- Extensión: larastan/larastan
- Archivo de configuración: phpstan.neon
- Ignora errores de: PHPUnit TestCase y variables $this no definidas

Reglas principales:
- Larastan es análisis estático de tipos para detectar bugs antes de runtime.
- Usa nivel 5 (balance entre rigor y practicidad).
- Ejecutar dentro de Sail: ./vendor/bin/sail php vendor/bin/phpstan

Comandos recomendados:
```zsh
# Analizar todo el proyecto
./vendor/bin/sail php vendor/bin/phpstan analyse

# Analizar con output detallado
./vendor/bin/sail php vendor/bin/phpstan analyse --verbose

# Analizar un path específico
./vendor/bin/sail php vendor/bin/phpstan analyse app/Models

# Analizar con nivel específico (sobreescribe config)
./vendor/bin/sail php vendor/bin/phpstan analyse --level 6

# Generar baseline (ignorar errores actuales)
./vendor/bin/sail php vendor/bin/phpstan analyse --generate-baseline
```

Cuándo ejecutar Larastan:
- Después de implementar nuevas features o lógica compleja.
- Antes de hacer merge a branches principales.
- Al refactorizar código existente.
- Periódicamente en el pipeline de CI/CD.

Buenas prácticas:
- Resolver errores de tipo antes de hacer commit.
- Agregar type hints explícitos (parámetros, returns, properties).
- Usar PHPDoc para tipos complejos (arrays, generics).
- No ignorar errores sin justificación; agrégalos a ignoreErrors solo si es necesario.
- Aspirar a subir el nivel progresivamente (hacia nivel 9).

=== FLUJO DE TRABAJO RECOMENDADO ===

Orden de ejecución al hacer cambios de código:

1. Escribir/modificar código PHP
2. Ejecutar Rector (opcional, si hay refactorings necesarios):
   ./vendor/bin/sail php vendor/bin/rector process --dry-run

3. Ejecutar Larastan para detectar errores de tipos:
   ./vendor/bin/sail php vendor/bin/phpstan analyse

4. Corregir errores reportados por Larastan

5. Ejecutar Pint para formatear:
   ./vendor/bin/sail pint --dirty

6. Ejecutar tests relacionados:
   ./vendor/bin/sail php artisan test --filter=TestName

7. Hacer commit si todo pasa correctamente

=== INTEGRACIÓN CON GUIDELINES EXISTENTES ===

Consistencia con otras guidelines:
- Usar siempre Sail para ejecutar comandos (ver sail.blade.php).
- Shell por defecto: zsh.
- Incluir `--no-interaction` en comandos artisan cuando aplique.
- Ejecutar Pint es obligatorio antes del comando `submit`.

Notas para la IA:
- Menciona en tus respuestas cuando ejecutes estas herramientas.
- Si detectas violaciones de estilo o tipos, corrígelas antes de finalizar.
- Informa al usuario si Larastan reporta errores críticos.
- No modifiques los archivos de configuración (pint.json, rector.php, phpstan.neon) sin aprobación explícita.
- Estas herramientas son parte del flujo de desarrollo, no opcionales.

Fin de las directrices.
