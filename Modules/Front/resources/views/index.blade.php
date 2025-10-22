<x-front::layouts.master>

    <div class="max-w-7xl mx-auto p-6 mt-20">
        <div
            id="header-banner"
            class="grid grid-cols-1 lg:grid-cols-2 gap-6 items-stretch">

            <div class="h-full">
                <img src="{{ asset('images/mobile-banner.jpg') }}"
                     alt="Solicitar préstamo con WiCred"
                     class="w-full h-full object-cover rounded-md">
            </div>

            <div class="h-full flex flex-col space-y-3">
                <p class="flex-1 flex items-center justify-center text-2xl font-semibold bg-green-500 text-center py-5 lg:py-0 text-white">
                    Pedí tu préstamo
                </p>
                <p class="flex-1 flex items-center justify-center text-2xl bg-blue-600 text-center py-5 lg:py-0 text-white">
                    Pagar cuota
                </p>
            </div>

        </div>
    </div>

</x-front::layouts.master>
