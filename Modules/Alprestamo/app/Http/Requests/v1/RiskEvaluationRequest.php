<?php

declare(strict_types=1);

namespace Modules\Alprestamo\Http\Requests\v1;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;
use Modules\Alprestamo\Enums\EmploymentStatus;

class RiskEvaluationRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'national_id' => ['required', 'string', 'max:20'],
            'first_name' => ['required', 'string', 'max:255'],
            'last_name' => ['required', 'string', 'max:255'],
            'gender' => ['required', 'string', 'in:M,F'],
            'date_of_birth' => ['required', 'date', 'date_format:Y-m-d'],
            'employment_status' => ['required', 'string', Rule::enum(EmploymentStatus::class)],
            'tracking_id' => ['required', 'string', 'max:255'],
        ];
    }

    /**
     * Get custom messages for validator errors.
     *
     * @return array<string, string>
     */
    public function messages(): array
    {
        return [
            'national_id.required' => 'El DNI es requerido',
            'national_id.string' => 'El DNI debe ser una cadena de texto',
            'national_id.max' => 'El DNI no puede exceder 20 caracteres',
            'first_name.required' => 'El nombre es requerido',
            'first_name.string' => 'El nombre debe ser una cadena de texto',
            'first_name.max' => 'El nombre no puede exceder 255 caracteres',
            'last_name.required' => 'El apellido es requerido',
            'last_name.string' => 'El apellido debe ser una cadena de texto',
            'last_name.max' => 'El apellido no puede exceder 255 caracteres',
            'gender.required' => 'El género es requerido',
            'gender.string' => 'El género debe ser una cadena de texto',
            'gender.in' => 'El género debe ser M o F',
            'date_of_birth.required' => 'La fecha de nacimiento es requerida',
            'date_of_birth.date' => 'La fecha de nacimiento debe ser una fecha válida',
            'date_of_birth.date_format' => 'La fecha de nacimiento debe tener el formato YYYY-MM-DD',
            'employment_status.required' => 'La situación laboral es requerida',
            'employment_status.string' => 'La situación laboral debe ser una cadena de texto',
            'tracking_id.required' => 'El tracking_id es requerido',
            'tracking_id.string' => 'El tracking_id debe ser una cadena de texto',
            'tracking_id.max' => 'El tracking_id no puede exceder 255 caracteres',
        ];
    }
}
