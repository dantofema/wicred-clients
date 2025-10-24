<div class="min-h-[220px] flex items-center justify-center p-6">
    <div
        class="w-full max-w-xl bg-white dark:bg-gray-900 border border-gray-200 dark:border-gray-800 rounded-2xl shadow-lg p-6">
        <div class="flex items-center">
            <div>
                <h2 class="text-lg font-semibold text-gray-900 dark:text-gray-100">Pedí tu préstamo, simple!</h2>
            </div>
        </div>

        <div class="mt-6 grid grid-cols-1 gap-4">
            <div>
                <label for="dni" class="block text-sm font-medium text-gray-700 dark:text-gray-200">
                    Ingresa tu número de DNI
                </label>

                <div class="mt-2 relative">
                    <span class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                        <svg class="h-5 w-5 text-gray-400" xmlns="http://www.w3.org/2000/svg"
                             viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5"
                                  d="M12 11c1.657 0 3-1.343 3-3S13.657 5 12 5 9 6.343 9 8s1.343 3 3 3z"/>
                        </svg>
                    </span>

                    <input
                        id="dni"
                        name="dni"
                        type="text"
                        wire:model.live.debounce.300ms="dni"
                        maxlength="20"
                        inputmode="numeric"
                        autocomplete="off"
                        class="block w-full pl-10 pr-28 sm:pr-36 rounded-lg border-gray-300 dark:border-gray-700 bg-white dark:bg-gray-800 py-2 text-gray-900 dark:text-gray-100 placeholder-gray-400 focus:border-indigo-500 focus:ring-indigo-500"
                        placeholder="Ej. 2012345678"
                    />


                </div>

                <div class="mt-4">
                    <label class="flex items-start gap-3">
                        <input
                            type="checkbox"
                            wire:model.live="acceptedPrivacyPolicy"
                            class="mt-0.5 h-4 w-4 text-indigo-600 focus:ring-indigo-500 border-gray-300 dark:border-gray-700 rounded"
                        />
                        <span class="text-sm text-gray-700 dark:text-gray-300">
                            Acepto política de protección de datos personales y términos y condiciones del servicio.
                        </span>
                    </label>
                </div>

                <div class="mt-4">
                    <button
                        type="button"
                        wire:click="search"
                        wire:target="search"
                        wire:loading.attr="disabled"
                        @disabled(!$acceptedPrivacyPolicy)
                        class="inline-flex items-center gap-2 px-3 py-1.5 bg-indigo-600 text-white rounded-lg hover:bg-indigo-700 disabled:opacity-60 disabled:cursor-not-allowed focus:outline-none focus:ring-2 focus:ring-indigo-500"
                    >
                        <svg wire:loading.remove wire:target="search" class="h-4 w-4"
                             xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"
                             stroke="currentColor" aria-hidden="true">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5"
                                  d="M14 5l7 7m0 0l-7 7m7-7H3"/>
                        </svg>

                        <svg wire:loading wire:target="search" class="animate-spin h-4 w-4"
                             xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                            <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor"
                                    stroke-width="4"></circle>
                            <path class="opacity-75" fill="currentColor"
                                  d="M4 12a8 8 0 018-8v4a4 4 0 00-4 4H4z"></path>
                        </svg>

                        <span class="text-sm font-medium">Continuar</span>
                    </button>
                </div>

                @if($errorMessage)
                    <p class="mt-2 text-sm text-red-700">{{ $errorMessage }}</p>
                @endif
            </div>

            @if ($selectedPerson)
                {{-- Mostrar datos de la persona seleccionada --}}
                <div
                    class="mt-2 bg-green-50 dark:bg-green-900/20 border border-green-200 dark:border-green-800 rounded-lg p-4">
                    <div class="flex items-center justify-between">
                        <div>
                            <h3 class="text-sm font-semibold text-green-900 dark:text-green-100">Persona
                                seleccionada</h3>
                            <p class="mt-1 text-xs text-green-700 dark:text-green-300">Datos confirmados para
                                continuar</p>
                        </div>
                        <div class="text-xs text-green-600 dark:text-green-400">DNI: <span
                                class="font-medium">{{ $selectedPerson['dni'] ?? '-' }}</span></div>
                    </div>

                    <dl class="mt-4 grid grid-cols-1 sm:grid-cols-3 gap-4 text-sm text-green-700 dark:text-green-300">
                        <div class="sm:col-span-1">
                            <dt class="text-xs text-green-600 dark:text-green-400">Nombre</dt>
                            <dd class="mt-1 font-medium text-green-900 dark:text-green-100">{{ $selectedPerson['name'] ?? '-' }}</dd>
                        </div>

                        <div class="sm:col-span-1">
                            <dt class="text-xs text-green-600 dark:text-green-400">Apellido</dt>
                            <dd class="mt-1 font-medium text-green-900 dark:text-green-100">{{ $selectedPerson['last_name'] ?? '-' }}</dd>
                        </div>

                        <div class="sm:col-span-1">
                            <dt class="text-xs text-green-600 dark:text-green-400">CUIL</dt>
                            <dd class="mt-1 font-medium text-green-900 dark:text-green-100">{{ $selectedPerson['cuil'] ?? '-' }}</dd>
                        </div>
                    </dl>
                    
                </div>
            @elseif ($persons && count($persons) > 1)
                {{-- Mostrar lista de personas para seleccionar --}}
                <div class="mt-2">
                    <h3 class="text-sm font-semibold text-gray-900 dark:text-gray-100 mb-3">
                        Se encontraron {{ count($persons) }} personas con este DNI. Selecciona la correcta:
                    </h3>

                    @foreach($persons as $index => $person)
                        <div
                            class="mb-3 bg-gray-50 dark:bg-gray-800 border border-gray-200 dark:border-gray-700 rounded-lg p-4 hover:bg-gray-100 dark:hover:bg-gray-750 transition-colors">
                            <div class="flex items-center justify-between">
                                <div class="flex-1">
                                    <div class="grid grid-cols-1 sm:grid-cols-3 gap-3 text-sm">
                                        <div>
                                            <dt class="text-xs text-gray-500 dark:text-gray-400">Nombre</dt>
                                            <dd class="mt-1 font-medium text-gray-900 dark:text-gray-100">{{ $person['name'] ?? '-' }}</dd>
                                        </div>
                                        <div>
                                            <dt class="text-xs text-gray-500 dark:text-gray-400">Apellido</dt>
                                            <dd class="mt-1 font-medium text-gray-900 dark:text-gray-100">{{ $person['last_name'] ?? '-' }}</dd>
                                        </div>
                                        <div>
                                            <dt class="text-xs text-gray-500 dark:text-gray-400">CUIL</dt>
                                            <dd class="mt-1 font-medium text-gray-900 dark:text-gray-100">{{ $person['cuil'] ?? '-' }}</dd>
                                        </div>
                                    </div>
                                </div>
                                <div class="ml-4">
                                    <button
                                        wire:click="selectPerson({{ $index }})"
                                        class="px-3 py-1.5 rounded-md bg-indigo-600 text-white text-sm hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-indigo-500"
                                        type="button">
                                        Seleccionar
                                    </button>
                                </div>
                            </div>
                        </div>
                    @endforeach
                </div>
            @endif
        </div>
    </div>
</div>
