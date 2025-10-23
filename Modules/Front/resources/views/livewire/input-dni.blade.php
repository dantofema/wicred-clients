<div>

    <label for="dni" class="block text-sm font-medium text-gray-700 dark:text-gray-200">ingrese su dni</label>

    <input
        id="dni"
        name="dni"
        type="text"
        wire:model.live="dni"
        maxlength="20"
        class="mt-1 block w-full rounded border-gray-300 dark:border-gray-700 bg-white dark:bg-gray-800 px-3 py-2 shadow-sm focus:ring-indigo-500 focus:border-indigo-500"
    />

    <button wire:click="search" class="px-3 py-1 rounded bg-blue-600 text-white">Ingresar</button>

    @if($errorMessage)
        <div class="mt-4 p-3 bg-red-100 text-red-700 border border-red-400 rounded">
            {{ $errorMessage }}
        </div>
    @endif

    @if ($person)
        <div class="mt-4 border rounded p-4 bg-white dark:bg-gray-800">
            <h3 class="text-sm font-semibold text-gray-700 dark:text-gray-200">Datos encontrados</h3>

            <dl class="mt-2 grid grid-cols-1 gap-2 text-sm text-gray-600 dark:text-gray-300">
                <div class="flex">
                    <dt class="w-28 font-medium">DNI:</dt>
                    <dd>{{ $person['dni'] ?? '-' }}</dd>
                </div>
                <div class="flex">
                    <dt class="w-28 font-medium">Nombre:</dt>
                    <dd>{{ $person['name'] ?? '-' }}</dd>
                </div>
                <div class="flex">
                    <dt class="w-28 font-medium">Apellido:</dt>
                    <dd>{{ $person['last_name'] ?? '-' }}</dd>
                </div>
                <div class="flex">
                    <dt class="w-28 font-medium">CUIL:</dt>
                    <dd>{{ $person['cuil'] ?? '-' }}</dd>
                </div>
            </dl>
        </div>
    @endif
</div>
