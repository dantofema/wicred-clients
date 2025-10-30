<?php

declare(strict_types=1);

use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Http;
use Modules\Teleprom\Support\TelepromAuthClient;
use Tests\TestCase;

uses(TestCase::class);

beforeEach(function () {
    Cache::flush();
});

test('obtiene y cachea el token correctamente', function () {
    Http::fake([
        '*/Auth' => Http::response([
            'token' => 'test-token-123',
            'expires' => '2025-10-30T00:00:00Z',
        ], 200),
    ]);

    $client = new TelepromAuthClient(
        username: 'testuser',
        password: 'testpass',
        baseUrl: 'https://api.example.com'
    );

    $token = $client->token();

    expect($token)->toBe('test-token-123');

    Http::assertSent(function ($request) {
        return $request->url() === 'https://api.example.com/Auth'
            && $request['username'] === 'testuser'
            && $request['password'] === 'testpass';
    });
});

test('reutiliza el token cacheado sin hacer nueva petición', function () {
    Http::fake([
        '*/Auth' => Http::response([
            'token' => 'cached-token',
            'expires' => '2025-10-30T00:00:00Z',
        ], 200),
    ]);

    $client = new TelepromAuthClient(
        username: 'testuser',
        password: 'testpass',
        baseUrl: 'https://api.example.com'
    );

    $firstToken = $client->token();
    $secondToken = $client->token();

    expect($firstToken)->toBe('cached-token');
    expect($secondToken)->toBe('cached-token');

    Http::assertSentCount(1);
});

test('lanza excepción cuando las credenciales son inválidas', function () {
    Http::fake([
        '*/Auth' => Http::response([], 401),
    ]);

    $client = new TelepromAuthClient(
        username: 'wronguser',
        password: 'wrongpass',
        baseUrl: 'https://api.example.com'
    );

    $client->token();
})->throws(RuntimeException::class, 'Credenciales inválidas de Teleprom.');

test('lanza excepción cuando no se recibe el token', function () {
    Http::fake([
        '*/Auth' => Http::response([
            'expires' => '2025-10-30T00:00:00Z',
        ], 200),
    ]);

    $client = new TelepromAuthClient(
        username: 'testuser',
        password: 'testpass',
        baseUrl: 'https://api.example.com'
    );

    $client->token();
})->throws(RuntimeException::class, 'No se recibió el token de Teleprom.');

test('lanza excepción cuando el token está vacío', function () {
    Http::fake([
        '*/Auth' => Http::response([
            'token' => '',
            'expires' => '2025-10-30T00:00:00Z',
        ], 200),
    ]);

    $client = new TelepromAuthClient(
        username: 'testuser',
        password: 'testpass',
        baseUrl: 'https://api.example.com'
    );

    $client->token();
})->throws(RuntimeException::class, 'No se recibió el token de Teleprom.');

test('elimina el token del cache correctamente', function () {
    Http::fake([
        '*/Auth' => Http::response([
            'token' => 'test-token-123',
            'expires' => '2025-10-30T00:00:00Z',
        ], 200),
    ]);

    $client = new TelepromAuthClient(
        username: 'testuser',
        password: 'testpass',
        baseUrl: 'https://api.example.com'
    );

    $firstToken = $client->token();
    expect($firstToken)->toBe('test-token-123');

    $client->clearToken();

    $secondToken = $client->token();
    expect($secondToken)->toBe('test-token-123');

    Http::assertSentCount(2);
});

test('usa diferentes claves de cache para diferentes usuarios', function () {
    Http::fake([
        '*/Auth' => Http::sequence()
            ->push(['token' => 'token-user1', 'expires' => '2025-10-30T00:00:00Z'], 200)
            ->push(['token' => 'token-user2', 'expires' => '2025-10-30T00:00:00Z'], 200),
    ]);

    $client1 = new TelepromAuthClient(
        username: 'user1',
        password: 'pass1',
        baseUrl: 'https://api.example.com'
    );

    $client2 = new TelepromAuthClient(
        username: 'user2',
        password: 'pass2',
        baseUrl: 'https://api.example.com'
    );

    $token1 = $client1->token();
    $token2 = $client2->token();

    expect($token1)->toBe('token-user1');
    expect($token2)->toBe('token-user2');

    Http::assertSentCount(2);
});
