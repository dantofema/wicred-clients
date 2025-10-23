<div class="min-h-[220px] flex items-center justify-center p-6">
    <div
        class="w-full max-w-xl bg-white dark:bg-gray-900 border border-gray-200 dark:border-gray-800 rounded-2xl shadow-lg p-6">
        <div class="flex items-center justify-between gap-4">
            <div>
                <h2 class="text-lg font-semibold text-gray-900 dark:text-gray-100">Consultar DNI</h2>
                <p class="mt-1 text-sm text-gray-600 dark:text-gray-400">Ingresa el DNI para verificar identidad en el
                    registro.</p>
            </div>
            <div class="hidden sm:flex items-center text-sm text-gray-500 dark:text-gray-400">
                <svg class="w-6 h-6 text-indigo-600 dark:text-indigo-400 mr-2" xmlns="http://www.w3.org/2000/svg"
                     fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5"
                          d="M12 11c1.657 0 3-1.343 3-3S13.657 5 12 5 9 6.343 9 8s1.343 3 3 3z"/>
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5"
                          d="M19.4 21a8.6 8.6 0 10-14.8 0"/>
                </svg>
                <span>Verificación instantánea</span>
            </div>
        </div>

        <div class="mt-6 grid grid-cols-1 gap-4">
            <div>
                <label for="dni" class="block text-sm font-medium text-gray-700 dark:text-gray-200">DNI</label>

                <div class="mt-2 relative">
                    <span class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                        <svg class="h-5 w-5 text-gray-400" xmlns="http://www.w3.org/2000/svg" fill="none"
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

                    <div class="absolute inset-y-0 right-0 flex items-center pr-1">
                        <button
                            type="button"
                            wire:click="search"
                            wire:target="search"
                            wire:loading.attr="disabled"
                            class="inline-flex items-center gap-2 px-3 py-1.5 bg-indigo-600 text-white rounded-lg hover:bg-indigo-700 disabled:opacity-60 focus:outline-none focus:ring-2 focus:ring-indigo-500"
                        >
                            <svg wire:loading.remove wire:target="search" class="h-4 w-4"
                                 xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                 stroke="currentColor" aria-hidden="true">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5"
                                      d="M14 5l7 7m0 0l-7 7m7-7H3"/>
                            </svg>

                            <svg wire:loading wire:target="search" class="animate-spin h-4 w-4"
                                 xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
                                <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor"
                                        stroke-width="4"></circle>
                                <path class="opacity-75" fill="currentColor"
                                      d="M4 12a8 8 0 018-8v4a4 4 0 00-4 4H4z"></path>
                            </svg>

                            <span class="text-sm font-medium">Ingresar</span>
                        </button>
                    </div>
                </div>

                @if($errorMessage)
                    <p class="mt-2 text-sm text-red-700">{{ $errorMessage }}</p>
                @endif
            </div>

            @if ($person)
                <div
                    class="mt-2 bg-gray-50 dark:bg-gray-800 border border-gray-100 dark:border-gray-800 rounded-lg p-4">
                    <div class="flex items-center justify-between">
                        <div>
                            <h3 class="text-sm font-semibold text-gray-900 dark:text-gray-100">Datos encontrados</h3>
                            <p class="mt-1 text-xs text-gray-500 dark:text-gray-400">Verifica que los datos coincidan
                                con la persona que solicita el trámite.</p>
                        </div>
                        <div class="text-xs text-gray-500 dark:text-gray-400">ID: <span
                                class="font-medium">{{ $person['dni'] ?? '-' }}</span></div>
                    </div>

                    <dl class="mt-4 grid grid-cols-1 sm:grid-cols-3 gap-4 text-sm text-gray-700 dark:text-gray-300">
                        <div class="sm:col-span-1">
                            <dt class="text-xs text-gray-500">Nombre</dt>
                            <dd class="mt-1 font-medium text-gray-900 dark:text-gray-100">{{ $person['name'] ?? '-' }}</dd>
                        </div>

                        <div class="sm:col-span-1">
                            <dt class="text-xs text-gray-500">Apellido</dt>
                            <dd class="mt-1 font-medium text-gray-900 dark:text-gray-100">{{ $person['last_name'] ?? '-' }}</dd>
                        </div>

                        <div class="sm:col-span-1">
                            <dt class="text-xs text-gray-500">CUIL</dt>
                            <dd class="mt-1 font-medium text-gray-900 dark:text-gray-100">{{ $person['cuil'] ?? '-' }}</dd>
                        </div>
                    </dl>

                    <div class="mt-4 flex items-center gap-3">
                        <button
                            class="px-3 py-1.5 rounded-md border border-gray-200 dark:border-gray-700 text-sm text-gray-700 dark:text-gray-200 bg-white dark:bg-gray-900 hover:bg-gray-50"
                            type="button">Ver perfil
                        </button>
                        <button class="px-3 py-1.5 rounded-md bg-indigo-600 text-white text-sm hover:bg-indigo-700"
                                type="button">Continuar
                        </button>
                    </div>
                </div>
            @endif
        </div>
    </div>
</div>
