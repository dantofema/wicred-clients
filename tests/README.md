# Configuración de Tests

Este proyecto utiliza dos bases de datos MariaDB para los tests:

## Bases de Datos de Testing

1. **Base de datos principal** (`mariadb`): `wicred_clients_testing`
    - Conexión por defecto para los tests
    - Utilizada por modelos que no especifican una conexión explícita

2. **Base de datos secundaria** (`bd_datos`): `bd_datos_testing`
    - Conexión para modelos que requieren acceso a datos externos
    - Utilizada por modelos que especifican `protected $connection = 'bd_datos';`

## Configuración en phpunit.xml

```xml
<env name="DB_CONNECTION" value="mariadb"/>
<env name="DB_DATABASE" value="wicred_clients_testing"/>
<env name="DB_DATOS_DATABASE" value="bd_datos_testing"/>
```

## Uso en Tests

### Usar la base de datos por defecto (mariadb)

```php
use Illuminate\Foundation\Testing\RefreshDatabase;

uses(RefreshDatabase::class);

it('uses default database', function () {
    $user = User::factory()->create();
    
    expect($user)->toBeInstanceOf(User::class);
});
```

### Usar la base de datos secundaria (bd_datos)

```php
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Support\Facades\DB;

uses(RefreshDatabase::class);

it('uses bd_datos connection', function () {
    // Consultar directamente la conexión bd_datos
    $results = DB::connection('bd_datos')->table('ejemplo')->get();
    
    expect($results)->toBeArray();
});
```

### Usar ambas bases de datos en un mismo test

```php
use Illuminate\Foundation\Testing\RefreshDatabase;

uses(RefreshDatabase::class);

it('can use both databases', function () {
    // Usar la base de datos principal
    $user = User::factory()->create();
    
    // Usar la base de datos bd_datos
    $example = ExampleBdDatosModel::create([
        'field' => 'value',
    ]);
    
    expect($user)->toBeInstanceOf(User::class);
    expect($example)->toBeInstanceOf(ExampleBdDatosModel::class);
});
```

## Ejecutar Tests

```bash
# Ejecutar todos los tests
./vendor/bin/sail artisan test

# Ejecutar tests específicos
./vendor/bin/sail artisan test --filter="InputDniTest"

# Ejecutar tests con filtro de nombre
./vendor/bin/sail artisan test --filter="it finds a person by dni"
```

## Migraciones de Testing

Las migraciones se ejecutan automáticamente en ambas bases de datos cuando se usa `RefreshDatabase`:

```bash
# Ejecutar migraciones manualmente en la base de datos de testing
./vendor/bin/sail artisan migrate:fresh --env=testing

# Ejecutar migraciones en la base de datos bd_datos
./vendor/bin/sail artisan migrate:fresh --database=bd_datos --env=testing
```

## Verificar las Bases de Datos

```bash
# Ver las bases de datos de testing
./vendor/bin/sail exec mariadb mysql -uroot -ppassword -e "SHOW DATABASES LIKE '%testing%';"

# Ver las tablas en wicred_clients_testing
./vendor/bin/sail exec mariadb mysql -uroot -ppassword wicred_clients_testing -e "SHOW TABLES;"

# Ver las tablas en bd_datos_testing
./vendor/bin/sail exec mariadb mysql -uroot -ppassword bd_datos_testing -e "SHOW TABLES;"
```

## Notas Importantes

- El trait `RefreshDatabase` limpia automáticamente ambas bases de datos después de cada test
- Las factories deben estar configuradas para usar la conexión correcta según el modelo
- Los seeders también deben especificar la conexión si no usan la conexión por defecto

