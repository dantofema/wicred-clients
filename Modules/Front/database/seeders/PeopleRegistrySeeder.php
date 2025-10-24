<?php

namespace Modules\Front\Database\Seeders;

use Illuminate\Database\Seeder;
use Modules\Front\PeopleRegistry;

class PeopleRegistrySeeder extends Seeder
{
    public function run(): void
    {

        PeopleRegistry::factory()
            ->count(2)
            ->create([
                'dni' => '12345678',
            ]);

        PeopleRegistry::factory()->create([
            'dni' => '23456789',
        ]);
    }
}
