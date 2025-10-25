<?php

declare(strict_types=1);

use Illuminate\Foundation\Testing\RefreshDatabase;
use Modules\Front\PeopleRegistry;

uses(RefreshDatabase::class);

it('scopeNotDeceased devuelve solo personas no fallecidas', function () {
    PeopleRegistry::factory()->create(['is_deceased' => false, 'dni' => '123', 'cuil' => '20-123', 'name' => 'Vivo']);
    PeopleRegistry::factory()->create(['is_deceased' => true, 'dni' => '456', 'cuil' => '20-456', 'name' => 'Fallecido']);

    $result = PeopleRegistry::query()->notDeceased()->get();

    expect($result)->toHaveCount(1)
        ->and($result->first()->name)->toBe('Vivo')
        ->and($result->first()->is_deceased)->toBeFalse();
});
