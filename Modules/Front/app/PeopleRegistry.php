<?php

namespace Modules\Front;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Modules\Front\Database\Factories\PeopleRegistryFactory;

class PeopleRegistry extends Model
{
    use HasFactory;

    protected $fillable = [
        'dni',
        'cuil',
        'name',
        'is_deceased',
    ];

    protected function casts(): array
    {
        return [
            'is_deceased' => 'boolean',
        ];
    }

    /**
     * Resolve the model factory for the model.
     */
    protected static function newFactory(): Factory
    {
        return PeopleRegistryFactory::new();
    }

    /**
     * Scope para obtener personas no fallecidas.
     */
    public function scopeNotDeceased(Builder $query): Builder
    {
        return $query->where('is_deceased', false);
    }
}
