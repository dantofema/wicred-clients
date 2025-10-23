<?php

declare(strict_types=1);

use Illuminate\Foundation\Testing\RefreshDatabase;
use Livewire\Livewire;
use Modules\Front\Livewire\InputDni;
use Modules\Front\PeopleRegistry;

uses(RefreshDatabase::class);

it('finds a person by dni', function () {
    $person = PeopleRegistry::factory()->create(['dni' => '12345678']);

    Livewire::test(InputDni::class)
        ->set('dni', '12345678')
        ->call('search')
        ->assertHasNoErrors()
        ->assertSet('person', fn($p) => is_array($p) && ($p['dni'] ?? null) === '12345678');
});

it('adds an error when person not found', function () {
    Livewire::test(InputDni::class)
        ->set('dni', '00000000')
        ->call('search')
        ->assertHasErrors(['dni']);
});

