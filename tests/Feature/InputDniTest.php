<?php

declare(strict_types=1);

use Illuminate\Foundation\Testing\RefreshDatabase;
use Livewire\Livewire;
use Modules\Front\Livewire\InputDni;
use Modules\Front\PeopleRegistry;

uses(RefreshDatabase::class);

it('finds a person by dni', function () {
    PeopleRegistry::factory()->create(['dni' => '12345678']);

    Livewire::test(InputDni::class)
        ->set('dni', '12345678')
        ->call('search')
        ->assertHasNoErrors()
        ->assertSet('person', fn ($p) => is_array($p) && ($p['dni'] ?? null) === '12345678');
});

it('adds an error when person not found', function () {
    Livewire::test(InputDni::class)
        ->set('dni', '00000000')
        ->call('search')
        // The component no longer uses validation errors. It now exposes an `errorMessage` property.
        // Assert that `errorMessage` is a non-empty string.
        ->assertSet('errorMessage', fn ($m) => is_string($m) && ! empty($m));
});

it('adds an error when dni is empty', function () {
    Livewire::test(InputDni::class)
        ->set('dni', '')
        ->call('search')
        ->assertSet('errorMessage', 'Por favor ingrese un DNI.')
        ->assertSet('person', null);
});
