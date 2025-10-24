# Configuración de Múltiples Bases de Datos

Este proyecto utiliza dos bases de datos MariaDB:

1. **wicred_clients** - Base de datos principal de la aplicación
2. **bd_datos** - Base de datos adicional

## Configuración

Ambas bases de datos se ejecutan en el mismo contenedor MariaDB y se crean automáticamente al iniciar los contenedores.

### Conexiones disponibles

- `mariadb` - Conexión por defecto (wicred_clients)
- `bd_datos` - Conexión a la base de datos bd_datos

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

