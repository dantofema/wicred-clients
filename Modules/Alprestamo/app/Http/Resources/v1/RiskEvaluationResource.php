<?php

declare(strict_types=1);

namespace Modules\Alprestamo\Http\Resources\v1;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class RiskEvaluationResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'status' => $this->resource['status'],
            'customer_id' => $this->when(
                $this->resource['status'] === 'preapproved',
                $this->resource['customer_id'] ?? null
            ),
            'redirect_url' => $this->when(
                isset($this->resource['redirect_url']),
                $this->resource['redirect_url']
            ),
            'offer_max_amount' => $this->when(
                $this->resource['status'] === 'preapproved' && isset($this->resource['offer_max_amount']),
                $this->resource['offer_max_amount']
            ),
            'payment_amount' => $this->when(
                $this->resource['status'] === 'preapproved' && isset($this->resource['payment_amount']),
                $this->resource['payment_amount']
            ),
            'payment_term' => $this->when(
                $this->resource['status'] === 'preapproved' && isset($this->resource['payment_term']),
                $this->resource['payment_term']
            ),
            'reject_reason' => $this->when(
                $this->resource['status'] === 'rejected' && isset($this->resource['reject_reason']),
                $this->resource['reject_reason']
            ),
            'error_code' => $this->when(
                $this->resource['status'] === 'error' && isset($this->resource['error_code']),
                $this->resource['error_code']
            ),
            'error_message' => $this->when(
                $this->resource['status'] === 'error' && isset($this->resource['error_message']),
                $this->resource['error_message']
            ),
        ];
    }
}
