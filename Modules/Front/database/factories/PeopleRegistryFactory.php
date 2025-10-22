<?php

namespace Modules\Front\Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Carbon;
use Modules\Front\PeopleRegistry;

class PeopleRegistryFactory extends Factory
{
    protected $model = PeopleRegistry::class;

    public function definition(): array
    {
        $dni = str_pad((string) $this->faker->numberBetween(10000000, 99999999), 8, '0', STR_PAD_LEFT);

        return [
            'dni' => $dni,
            'name' => $this->faker->name(),
            'last_name' => $this->faker->lastName(),
            'cuil' => fn (array $attributes) => "20-{$attributes['dni']}-0",
            'created_at' => Carbon::now(),
            'updated_at' => Carbon::now(),
        ];
    }
}
