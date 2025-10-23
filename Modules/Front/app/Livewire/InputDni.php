<?php

namespace Modules\Front\Livewire;

use Livewire\Component;
use Modules\Front\PeopleRegistry;

class InputDni extends Component
{
    public string $dni = '';
    public string $errorMessage = '';

    /**
     * Person data loaded from the registry (or null when not found).
     * Stored as an array with keys like dni, name, last_name, cuil.
     *
     * @var array|null
     */
    public ?array $person = null;

    public function render()
    {
        return view('front::livewire.input-dni');
    }

    public function updatedDni(string $value): void
    {
        // Reset the displayed error message when the user updates the DNI field
        $this->errorMessage = '';
        $this->person = null;
        // Also clear any validation errors for the dni field so UI validation messages disappear
        $this->resetErrorBag('dni');
    }

    /**
     * Backwards-compatible alias so `search` calls still work.
     */
    public function search(): void
    {

        $this->errorMessage = '';

        // Normalize DNI: remove any non-digit characters
        $normalizedDni = preg_replace('/\D+/', '', $this->dni) ?? '';
        $this->dni = $normalizedDni;

        $found = PeopleRegistry::where('dni', $this->dni)->first();

        if ($found === null) {
            $this->person = null;
            $this->errorMessage = 'No se encontró registro con ese DNI.';

            return;
        }

        $this->person = $found->only(['dni', 'name', 'last_name', 'cuil']);
    }

    public function increment(): void
    {
        $this->count++;
    }
}
