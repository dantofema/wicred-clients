<?php

declare(strict_types=1);

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

uses(RefreshDatabase::class);

it('can use the default mariadb connection', function () {
    // Verificar que la conexión por defecto es mariadb
    expect(config('database.default'))->toBe('mariadb');

    // Verificar que la base de datos de testing está configurada
    expect(config('database.connections.mariadb.database'))->toBe('wicred_clients_testing');

    // Verificar que las tablas existen en la base de datos principal
    expect(Schema::hasTable('users'))->toBeTrue();
    expect(Schema::hasTable('people_registries'))->toBeTrue();
});

it('can use the bd_datos connection', function () {
    // Verificar que la conexión bd_datos está configurada correctamente
    expect(config('database.connections.bd_datos.database'))->toBe('bd_datos_testing');

    // Verificar que podemos conectarnos a la base de datos bd_datos
    $connection = DB::connection('bd_datos');
    expect($connection)->not->toBeNull();

    // Verificar el nombre de la base de datos
    $databaseName = $connection->getDatabaseName();
    expect($databaseName)->toBe('bd_datos_testing');
});

it('can switch between database connections', function () {
    // Usar la conexión por defecto
    $defaultConnection = DB::connection();
    expect($defaultConnection->getDatabaseName())->toBe('wicred_clients_testing');

    // Cambiar a la conexión bd_datos
    $bdDatosConnection = DB::connection('bd_datos');
    expect($bdDatosConnection->getDatabaseName())->toBe('bd_datos_testing');

    // Verificar que son conexiones diferentes
    expect($defaultConnection->getDatabaseName())->not->toBe($bdDatosConnection->getDatabaseName());
});
