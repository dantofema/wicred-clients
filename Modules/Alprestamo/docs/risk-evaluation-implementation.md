# Implementación API Risk Evaluation - Wicred

## Descripción General

Implementación del endpoint de evaluación de riesgo según el modelo de integración de Alprestamo.

## Endpoint

```
POST /api/v1/risk-evaluation
```

## Autenticación

Todas las peticiones deben incluir el header `x-api-key` con la API Key configurada:

```
x-api-key: {API_KEY}
```

La API Key se configura en el archivo `.env`:

```env
ALPRESTAMO_API_KEY=tu_api_key_aqui
```

Si no está configurada `ALPRESTAMO_API_KEY`, se utiliza el valor de `API_KEY` como fallback.

## Request

### Headers

| Header       | Tipo   | Requerido | Descripción                |
|--------------|--------|-----------|----------------------------|
| x-api-key    | string | Sí        | API Key para autenticación |
| Content-Type | string | Sí        | application/json           |

### Body Parameters

| Campo             | Tipo   | Requerido | Descripción                                   | Validación             |
|-------------------|--------|-----------|-----------------------------------------------|------------------------|
| national_id       | string | Sí        | DNI del usuario                               | max:20                 |
| first_name        | string | Sí        | Nombre del usuario                            | max:255                |
| last_name         | string | Sí        | Apellido del usuario                          | max:255                |
| gender            | string | Sí        | Género: "F" para femenino, "M" para masculino | in:M,F                 |
| date_of_birth     | string | Sí        | Fecha de nacimiento en formato YYYY-MM-DD     | date_format:Y-m-d      |
| employment_status | string | Sí        | Situación laboral: E, G, I                    | enum(EmploymentStatus) |
| tracking_id       | string | Sí        | Código identificador del lead                 | max:255                |

### Employment Status Values

| Código | Descripción                              |
|--------|------------------------------------------|
| E      | Empleado                                 |
| G      | Empleado de Gobierno                     |
| I      | Trabajador Independiente (Self Employed) |

### Ejemplo de Request

```json
{
    "national_id": "38788807",
    "first_name": "tomas",
    "last_name": "perez",
    "gender": "M",
    "date_of_birth": "1980-04-27",
    "employment_status": "E",
    "tracking_id": "nf39d39dm30md"
}
```

## Response

### Respuesta Pre-Aprobada (200 OK)

```json
{
    "status": "preapproved",
    "customer_id": "CUST_123456",
    "redirect_url": "https://tu-dominio.com/onboarding/123456",
    "offer_max_amount": 50000.00,
    "payment_amount": 5000.00,
    "payment_term": 12
}
```

### Respuesta Rechazada (200 OK)

```json
{
    "status": "rejected",
    "reject_reason": "No cumple con los requisitos mínimos"
}
```

### Respuesta con Error (200 OK)

```json
{
    "status": "error",
    "error_code": "500",
    "error_message": "Error interno del servidor"
}
```

### Error de Autenticación (401 Unauthorized)

```json
{
    "status": "error",
    "error_code": "401",
    "error_message": "No autorizado: API Key inválida o faltante"
}
```

### Error de Validación (422 Unprocessable Entity)

```json
{
    "message": "El DNI es requerido (and 1 more error)",
    "errors": {
        "national_id": [
            "El DNI es requerido"
        ],
        "gender": [
            "El género debe ser M o F"
        ]
    }
}
```

## Estructura del Código

### Archivos Creados

1. **Config**: `Modules/Alprestamo/config/alprestamo.php`
    - Configuración del módulo con la API Key

2. **Enum**: `Modules/Alprestamo/app/Enums/EmploymentStatus.php`
    - Enum para los tipos de situación laboral

3. **Request**: `Modules/Alprestamo/app/Http/Requests/v1/RiskEvaluationRequest.php`
    - Validación de datos del request

4. **Resource**: `Modules/Alprestamo/app/Http/Resources/v1/RiskEvaluationResource.php`
    - Formato del response

5. **Middleware**: `Modules/Alprestamo/app/Http/Middleware/ValidateApiKey.php`
    - Validación del header x-api-key

6. **Controller**: `Modules/Alprestamo/app/Http/Controllers/v1/RiskEvaluationController.php`
    - Lógica del endpoint

7. **Routes**: `Modules/Alprestamo/routes/api.php`
    - Registro de la ruta

## Uso

### Configuración Inicial

1. Agregar la API Key en el archivo `.env`:

```env
ALPRESTAMO_API_KEY=tu_api_key_secreta
```

2. La ruta está disponible automáticamente en:

```
POST {APP_URL}/api/v1/risk-evaluation
```

### Implementar Lógica de Negocio

El controlador `RiskEvaluationController` actualmente retorna una respuesta de ejemplo. Para implementar la lógica real
de evaluación de riesgo, modifica el método `__invoke()`:

```php
public function __invoke(RiskEvaluationRequest $request): JsonResponse
{
    $validated = $request->validated();
    
    // Implementa tu lógica de evaluación de riesgo aquí
    // Ejemplo:
    // $riskService = new RiskEvaluationService();
    // $result = $riskService->evaluate($validated);
    
    return (new RiskEvaluationResource($result))
        ->response()
        ->setStatusCode(200);
}
```

## Testing con cURL

### Ejemplo con Pre-Aprobación

```bash
curl -X POST https://tu-dominio.com/api/v1/risk-evaluation \
  -H "Content-Type: application/json" \
  -H "x-api-key: tu_api_key_aqui" \
  -d '{
    "national_id": "38788807",
    "first_name": "tomas",
    "last_name": "perez",
    "gender": "M",
    "date_of_birth": "1980-04-27",
    "employment_status": "E",
    "tracking_id": "nf39d39dm30md"
  }'
```

### Ejemplo con API Key Inválida

```bash
curl -X POST https://tu-dominio.com/api/v1/risk-evaluation \
  -H "Content-Type: application/json" \
  -H "x-api-key: api_key_invalida" \
  -d '{
    "national_id": "38788807",
    "first_name": "tomas",
    "last_name": "perez",
    "gender": "M",
    "date_of_birth": "1980-04-27",
    "employment_status": "E",
    "tracking_id": "nf39d39dm30md"
  }'
```

## Notas de Seguridad

1. **API Key**: Nunca compartas la API Key públicamente. Mantenla en el archivo `.env` que no debe subirse al
   repositorio.

2. **HTTPS**: En producción, asegúrate de usar HTTPS para proteger la API Key en tránsito.

3. **Rate Limiting**: Considera implementar rate limiting para prevenir abuso del endpoint.

## Próximos Pasos

1. Implementar la lógica real de evaluación de riesgo
2. Implementar el segundo endpoint `UpdateContactInformation` según documentación
3. Agregar logging de las peticiones para auditoría
4. Implementar Postback según especificaciones
5. Agregar tests (feature tests) para el endpoint

