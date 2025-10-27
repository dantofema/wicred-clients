<?php

declare(strict_types=1);

namespace Modules\Alprestamo\Http\Controllers\v1;

use Illuminate\Http\JsonResponse;
use Illuminate\Routing\Controller;
use Modules\Alprestamo\Http\Requests\v1\RiskEvaluationRequest;
use Modules\Alprestamo\Http\Resources\v1\RiskEvaluationResource;

class RiskEvaluationController extends Controller
{
    /**
     * Evalúa el riesgo de un usuario para pre-aprobación.
     */
    public function __invoke(RiskEvaluationRequest $request): JsonResponse
    {
        $validated = $request->validated();

        // Aquí implementarías la lógica de evaluación de riesgo
        // Por ahora retornamos una respuesta de ejemplo pre-aprobada
        $result = [
            'status' => 'preapproved',
            'customer_id' => uniqid('CUST_'),
            'redirect_url' => config('app.url').'/onboarding/'.uniqid(),
            'offer_max_amount' => 50000.00,
            'payment_amount' => 5000.00,
            'payment_term' => 12,
        ];

        // Ejemplo de respuesta rechazada:
        // $result = [
        //     'status' => 'rejected',
        //     'reject_reason' => 'No cumple con los requisitos mínimos',
        // ];

        // Ejemplo de respuesta con error:
        // $result = [
        //     'status' => 'error',
        //     'error_code' => '500',
        //     'error_message' => 'Error interno del servidor',
        // ];

        return (new RiskEvaluationResource($result))
            ->response()
            ->setStatusCode(200);
    }
}
