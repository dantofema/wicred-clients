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
        ->set('acceptedPrivacyPolicy', true)
        ->call('search')
        ->assertHasNoErrors()
        ->assertSet('persons', fn($persons) => is_array($persons) && count($persons) === 1)
        ->assertSet('selectedPerson', fn($person) => (
        is_array($person) ? (($person['dni'] ?? null) === '12345678') : (
            is_object($person) && ($person->dni ?? null) === '12345678'
        )));
});

it('adds an error when person not found', function () {
    Livewire::test(InputDni::class)
        ->set('dni', '00000000')
        ->call('search')
        // The component no longer uses validation errors. It now exposes an `errorMessage` property.
        // Assert that `errorMessage` is a non-empty string.
        ->assertSet('errorMessage', fn($m) => is_string($m) && !empty($m));
});

it('adds an error when dni is empty', function () {
    Livewire::test(InputDni::class)
        ->set('dni', '')
        ->set('acceptedPrivacyPolicy', true)
        ->call('search')
        ->assertSet('errorMessage', 'Por favor ingrese un DNI.')
        ->assertSet('persons', []);
});

it('requires privacy policy acceptance', function () {
    PeopleRegistry::factory()->create(['dni' => '12345678']);

    Livewire::test(InputDni::class)
        ->set('dni', '12345678')
        ->set('acceptedPrivacyPolicy', false)
        ->call('search')
        ->assertSet('errorMessage', 'Debes aceptar la política de protección de datos personales y términos y condiciones del servicio para continuar.')
        ->assertSet('persons', []);
});

it('finds multiple persons with same dni', function () {
    PeopleRegistry::factory()->count(2)->create(['dni' => '12345678']);

    Livewire::test(InputDni::class)
        ->set('dni', '12345678')
        ->set('acceptedPrivacyPolicy', true)
        ->call('search')
        ->assertHasNoErrors()
        ->assertSet('persons', fn($persons) => is_array($persons) && count($persons) === 2)
        ->assertSet('selectedPerson', null); // No debe seleccionar automáticamente cuando hay múltiples
});

it('normalizes dni by removing non-digit characters', function () {
    PeopleRegistry::factory()->create(['dni' => '12345678']);

    Livewire::test(InputDni::class)
        ->set('dni', '12.345.678')
        ->set('acceptedPrivacyPolicy', true)
        ->call('search')
        ->assertHasNoErrors()
        ->assertSet('dni', '12345678')
        ->assertSet('persons', fn($persons) => count($persons) > 0);
});

it('clears error message and persons when dni is updated', function () {
    $existingPerson = PeopleRegistry::factory()->make(['dni' => '99999999']);

    $component = Livewire::test(InputDni::class)
        ->set('errorMessage', 'Some error')
        ->set('persons', [$existingPerson])
        ->set('selectedPerson', $existingPerson)
        ->set('dni', '12345678');

    $component->assertSet('errorMessage', '')
        ->assertSet('persons', [])
        ->assertSet('selectedPerson', null);
});

it('allows selecting a specific person from multiple results', function () {
    $persons = PeopleRegistry::factory()->count(3)->create(['dni' => '12345678']);

    $component = Livewire::test(InputDni::class)
        ->set('dni', '12345678')
        ->set('acceptedPrivacyPolicy', true)
        ->call('search')
        ->assertSet('persons', fn($persons) => count($persons) === 3)
        ->assertSet('selectedPerson', null);

    // Seleccionar la segunda persona (índice 1)
    $component->call('selectPerson', 1)
        ->assertSet('selectedPerson', fn($person) => (
        is_array($person) ? (
            isset($person['dni']) && $person['dni'] === '12345678' && isset($person['name']) && isset($person['last_name'])
        ) : (
        is_object($person) ? (
            isset($person->dni) && $person->dni === '12345678' && isset($person->name) && isset($person->last_name)
        ) : false
        )
        ));
});

it('handles invalid person selection gracefully', function () {
    PeopleRegistry::factory()->count(2)->create(['dni' => '12345678']);

    $component = Livewire::test(InputDni::class)
        ->set('dni', '12345678')
        ->set('acceptedPrivacyPolicy', true)
        ->call('search')
        ->call('selectPerson', 99) // Índice que no existe
        ->assertSet('selectedPerson', null); // No debería cambiar
});

it('automatically selects person when only one is found', function () {
    $person = PeopleRegistry::factory()->create([
        'dni' => '12345678',
        'name' => 'Juan',
        'last_name' => 'Pérez'
    ]);

    Livewire::test(InputDni::class)
        ->set('dni', '12345678')
        ->set('acceptedPrivacyPolicy', true)
        ->call('search')
        ->assertSet('persons', fn($persons) => count($persons) === 1)
        ->assertSet('selectedPerson', fn($selected) => (
        is_array($selected) ? (
            ($selected['dni'] === '12345678') && ($selected['name'] === 'Juan') && ($selected['last_name'] === 'Pérez')
        ) : (
        is_object($selected) ? (
            ($selected->dni === '12345678') && ($selected->name === 'Juan') && ($selected->last_name === 'Pérez')
        ) : false
        )
        ));
});

