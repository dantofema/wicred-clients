
Laravel Boost — Directrices AI (Sail)

Propósito:
Estas directrices deben ser la única información dentro de este archivo. Son instrucciones para la IA sobre cómo generar comandos y recomendaciones para este repositorio.

Regla principal:
- Siempre usar Laravel Sail al documentar o recomendar comandos de consola dentro de este proyecto. Prefija los comandos con "./vendor/bin/sail" o usa el alias acordado "sail" cuando se documente en el README.

Formato y shell:
- Presenta los comandos en bloques de código e indica que el shell por defecto del desarrollador es zsh.

Comandos recomendados (ejemplos mínimos):
- Artisan:
  ./vendor/bin/sail php artisan migrate --seed
  ./vendor/bin/sail php artisan make:controller ExampleController --resource --no-interaction

- Composer:
  ./vendor/bin/sail composer install --no-interaction --prefer-dist

- Node / NPM / Vite:
  ./vendor/bin/sail npm install
  ./vendor/bin/sail npm run dev
  ./vendor/bin/sail npm run build

- Tests / Herramientas PHP:
  ./vendor/bin/sail php artisan test
  ./vendor/bin/sail pint --dirty
  ./vendor/bin/sail phpunit
  ./vendor/bin/sail pest

Buenas prácticas y notas para la IA:
- Siempre sugiere usar Sail en instrucciones reproducibles (local). No recomendar ejecutar comandos PHP/Composer/NPM directamente en la máquina host cuando el repo especifica Sail.
- Para comandos de Artisan o creación de artefactos, incluye `--no-interaction` cuando corresponda.
- Cuando recomiendes pasos que requieren dependencias de frontend (Vite), recuerda indicar que puede ser necesario ejecutar `npm run build` dentro de Sail si hay errores de manifest.
- Si la IA necesita consultar documentación de Laravel u paquetes, prefiera usar las herramientas/documentación internas del proyecto (p.ej. search-docs) y anotar versiones.
- Al generar cambios de código, recuerda aplicar el formateador del proyecto: ejecutar Pint (./vendor/bin/sail pint --dirty) antes de finalizar.
- Evita incluir secretos o instrucciones que modifiquen archivos de configuración sensibles sin pedir confirmación.

Fin de las directrices.

