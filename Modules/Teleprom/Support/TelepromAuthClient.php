<?php

namespace Modules\Teleprom\Support;

use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;

class TelepromAuthClient
{
    public function __construct(
        private string $username,
        private string $password,
        private string $baseUrl,
    ) {}

    public function token(): string
    {
        $cacheKey = 'teleprom.token.'.md5($this->username);

        return Cache::remember($cacheKey, now()->addDay(), function (): string {
            Log::info('Teleprom: Solicitando nuevo token de autenticación', [
                'username' => $this->username,
                'url' => $this->baseUrl.'/Auth',
            ]);

            $response = Http::asJson()->post($this->baseUrl.'/Auth', [
                'username' => $this->username,
                'password' => $this->password,
            ]);

            if ($response->unauthorized()) {
                Log::error('Teleprom: Credenciales inválidas', [
                    'username' => $this->username,
                    'status' => $response->status(),
                ]);

                throw new \RuntimeException('Credenciales inválidas de Teleprom.');
            }

            $response->throw();

            $token = (string) $response->json('token');

            if ($token === '') {
                Log::error('Teleprom: No se recibió el token en la respuesta', [
                    'response' => $response->json(),
                ]);

                throw new \RuntimeException('No se recibió el token de Teleprom.');
            }

            Log::info('Teleprom: Token obtenido y cacheado exitosamente', [
                'username' => $this->username,
                'expires' => $response->json('expires'),
            ]);

            return $token;
        });
    }

    public function clearToken(): void
    {
        $cacheKey = 'teleprom.token.'.md5($this->username);
        Cache::forget($cacheKey);

        Log::info('Teleprom: Token eliminado del cache', [
            'username' => $this->username,
        ]);
    }
}
