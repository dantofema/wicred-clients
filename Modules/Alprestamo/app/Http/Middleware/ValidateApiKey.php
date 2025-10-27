<?php

declare(strict_types=1);

namespace Modules\Alprestamo\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class ValidateApiKey
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        $apiKey = $request->header('x-api-key');
        $expectedApiKey = config('alprestamo.api_key');

        if (! $apiKey || $apiKey !== $expectedApiKey) {
            return response()->json([
                'status' => 'error',
                'error_code' => '401',
                'error_message' => 'No autorizado: API Key inválida o faltante',
            ], 401);
        }

        return $next($request);
    }
}
