<?php

namespace Modules\Teleprom\Support;

use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;

class TelepromTemplateClient
{
    public function __construct(
        private TelepromAuthClient $authClient,
        private string $baseUrl,
    ) {}

    /**
     * Obtiene el listado de plantillas disponibles.
     *
     * @return array{hsms?: array<mixed>, ...}
     */
    public function getTemplates(): array
    {
        Log::info('Teleprom: Solicitando listado de plantillas', [
            'url' => $this->baseUrl.'/GetTemplates',
        ]);

        $response = Http::withToken($this->authClient->token())
            ->acceptJson()
            ->get($this->baseUrl.'/GetTemplates');

        // Si el token expiró, limpiamos cache y reintentamos una vez.
        if ($response->status() === 401) {
            Log::warning('Teleprom: Token expirado (401), limpiando cache y reintentando', [
                'url' => $this->baseUrl.'/GetTemplates',
            ]);

            $this->authClient->clearToken();

            $response = Http::withToken($this->authClient->token())
                ->acceptJson()
                ->get($this->baseUrl.'/GetTemplates');
        }

        $response->throw();

        $data = (array) $response->json();

        Log::info('Teleprom: Plantillas obtenidas exitosamente', [
            'count' => count($data['hsms'] ?? []),
        ]);

        return $data;
    }
}
