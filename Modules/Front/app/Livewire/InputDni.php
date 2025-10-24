<?php

namespace Modules\Front\Livewire;

use Illuminate\View\View;
use Livewire\Component;
use Modules\Front\PeopleRegistry;

class InputDni extends Component
{
    public string $dni = '';

    public string $errorMessage = '';

    public bool $acceptedPrivacyPolicy = false;

    /**
     * Person data loaded from the registry (or null when not found).
     * Stored as an array with keys like dni, name, last_name, cuil.
     */
    public array $persons = [];

    /**
     * Selected person when there are multiple matches.
     * Stored as an array with keys like dni, name, last_name, cuil.
     */
    public ?array $selectedPerson = null;

    public function render(): View
    {
        return view('front::livewire.input-dni');
    }

    public function updatedDni(string $value): void
    {
        // Reset the displayed error message when the user updates the DNI field
        $this->errorMessage = '';
        $this->persons = [];
        $this->selectedPerson = null;
    }

    /**
     * Backwards-compatible alias so `search` calls still work.
     */
    public function search(): void
    {
        if (!$this->acceptedPrivacyPolicy) {
            $this->errorMessage = 'Debes aceptar la política de protección de datos personales y términos y condiciones del servicio para continuar.';
            $this->persons = [];

            return;
        }

        if ($this->dni === '') {
            $this->errorMessage = 'Por favor ingrese un DNI.';
            $this->persons = [];

            return;
        }

        $this->errorMessage = '';

        // Normalize DNI: remove any non-digit characters
        $normalizedDni = preg_replace('/\D+/', '', $this->dni) ?? '';
        $this->dni = $normalizedDni;

        $found = PeopleRegistry::where('dni', $this->dni)->get();

        if ($found->isEmpty()) {
            $this->persons = [];
            $this->selectedPerson = null;
            $this->errorMessage = 'No se encontró registro con ese DNI.';

            return;
        }

        $this->persons = $found->toArray();

        // Si hay una sola persona, seleccionarla automáticamente
        if (count($this->persons) === 1) {
            $this->selectedPerson = $this->persons[0];
        } else {
            // Si hay múltiples personas, limpiar la selección para que el usuario elija
            $this->selectedPerson = null;
        }
    }

    /**
     * Select a specific person from the list of found persons.
     */
    public function selectPerson(int $index): void
    {
        if (isset($this->persons[$index])) {
            $this->selectedPerson = $this->persons[$index];
        }
    }
}
