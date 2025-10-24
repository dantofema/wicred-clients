<?php

namespace Modules\Front;

use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Modules\Front\Database\Factories\PeopleRegistryFactory;

class PeopleRegistry extends Model
{
    use HasFactory;

    /**
     * Resolve the model factory for the model.
     */
    protected static function newFactory(): Factory
    {
        return PeopleRegistryFactory::new();
    }

    protected $fillable = [
        'dni',
        'cuil',
        'name',
        'is_deceased',
    ];
}
