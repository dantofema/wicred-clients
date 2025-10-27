<?php

declare(strict_types=1);

return [
    /*
    |--------------------------------------------------------------------------
    | API Key
    |--------------------------------------------------------------------------
    |
    | API Key utilizada para autenticar las peticiones desde Alprestamo.
    | Esta llave debe ser compartida con Alprestamo y enviada en el header
    | 'x-api-key' de cada petición.
    |
    */
    'api_key' => env('ALPRESTAMO_API_KEY', env('API_KEY')),
];
