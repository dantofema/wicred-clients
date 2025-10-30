# Configuración de Múltiples Bases de Datos

Este proyecto utiliza cuatro bases de datos MariaDB:

1. **wicred_clients** - Base de datos principal de la aplicación
2. **bd_datos** - Base de datos adicional
3. **wicred_clients_testing** - Base de datos de testing para wicred_clients
4. **bd_datos_testing** - Base de datos de testing para bd_datos

## Configuración

Todas las bases de datos se ejecutan en el mismo contenedor MariaDB y se crean automáticamente al iniciar los contenedores.

### Conexiones disponibles

- `mariadb` - Conexión por defecto (wicred_clients)
- `bd_datos` - Conexión a la base de datos bd_datos
- `mariadb_testing` - Conexión para testing (wicred_clients_testing)
- `bd_datos_testing` - Conexión para testing de bd_datos

### Uso en el código

Para usar la base de datos `bd_datos`:

```php
// En consultas
DB::connection('bd_datos')->table('tabla')->get();

// En modelos
class MiModelo extends Model
{
    protected $connection = 'bd_datos';
}

// En migraciones
Schema::connection('bd_datos')->create('tabla', function (Blueprint $table) {
    // ...
});
```

## Reiniciar contenedores

Si necesitas recrear las bases de datos:

```bash
./vendor/bin/sail down -v
./vendor/bin/sail up -d
```

**Nota:** El flag `-v` eliminará los volúmenes, por lo que perderás todos los datos.

