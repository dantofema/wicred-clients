import {
    defineConfig
} from 'vite';
import laravel from 'laravel-vite-plugin';
import tailwindcss from "@tailwindcss/vite";
import collectModuleAssetsPaths from './vite-module-loader.js';

export default defineConfig(async () => {
    const baseInputs = ['resources/css/app.css', 'resources/js/app.js'];
    const inputs = await collectModuleAssetsPaths(baseInputs, 'Modules');

    return {
        plugins: [
            laravel({
                input: inputs,
                refresh: true,
            }),
            tailwindcss(),
        ],
        server: {
            cors: true,
        },
    };
});
