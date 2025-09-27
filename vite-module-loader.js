// Collect module asset entry paths for Vite inputs.
// - Merges provided base paths with per-module asset entrypoints.
// - Supports JS/TS and CSS by default.
// - Conditionally includes SCSS if the project has `sass` installed at the root.
//
// Usage: const allPaths = await collectModuleAssetsPaths(['resources/css/app.css', 'resources/js/app.js'], 'Modules');

import { readdir, stat, access } from 'node:fs/promises';
import { constants as fsConstants } from 'node:fs';
import path from 'node:path';

/**
 * Check if a file exists and is a regular file.
 */
async function fileExists(filePath) {
    try {
        const s = await stat(filePath);
        return s.isFile();
    } catch {
        return false;
    }
}

/**
 * Check if sass is available at the project root (node_modules/sass).
 */
async function hasSassAtRoot(projectRoot) {
    try {
        await access(path.join(projectRoot, 'node_modules', 'sass', 'package.json'), fsConstants.F_OK);
        return true;
    } catch {
        return false;
    }
}

/**
 * Collect module asset entry files from modules under a given root.
 *
 * @param {string[]} basePaths - Base Vite inputs relative to project root.
 * @param {string} modulesRoot - Modules directory relative to project root. Defaults to 'Modules'.
 * @returns {Promise<string[]>} Merged, de-duplicated list of Vite input paths.
 */
export default async function collectModuleAssetsPaths(basePaths = [], modulesRoot = 'Modules') {
    const projectRoot = process.cwd();
    const absoluteModulesRoot = path.resolve(projectRoot, modulesRoot);

    let moduleDirs = [];
    try {
        const entries = await readdir(absoluteModulesRoot, { withFileTypes: true });
        moduleDirs = entries.filter((e) => e.isDirectory()).map((e) => e.name);
    } catch {
        // No modules directory or not accessible; just return base paths.
        return Array.from(new Set(basePaths));
    }

    const includeScss = await hasSassAtRoot(projectRoot);

    const collected = [];

    for (const mod of moduleDirs) {
        // Candidate entrypoints relative to the module directory
        const candidates = [
            // JS/TS entries
            'resources/assets/js/app.js',
            'resources/assets/ts/app.ts',
            // CSS/SCSS entries
            'resources/assets/css/app.css',
            ...(includeScss ? ['resources/assets/sass/app.scss'] : []),
        ];

        for (const rel of candidates) {
            const absoluteCandidate = path.join(absoluteModulesRoot, mod, rel);
            // For Vite input we need a path relative to project root
            const inputPath = path.join(modulesRoot, mod, rel);

            if (await fileExists(absoluteCandidate)) {
                collected.push(inputPath);
            }
        }
    }

    // Merge base paths first, then module collected paths, removing duplicates while preserving order.
    const merged = [...basePaths, ...collected];
    const seen = new Set();
    const uniqueOrdered = merged.filter((p) => {
        if (seen.has(p)) {
            return false;
        }
        seen.add(p);
        return true;
    });

    // If SCSS entries were detected but sass is missing, give a helpful console note once.
    if (!includeScss) {
        const hadScss = moduleDirs.some((mod) => {
            const rel = path.join(modulesRoot, mod, 'resources/assets/sass/app.scss');
            return uniqueOrdered.includes(rel);
        });
        if (hadScss) {
            // Remove SCSS entries because sass is not available
            for (let i = uniqueOrdered.length - 1; i >= 0; i--) {
                if (uniqueOrdered[i].endsWith('/resources/assets/sass/app.scss')) {
                    uniqueOrdered.splice(i, 1);
                }
            }
            // eslint-disable-next-line no-console
            console.warn('[vite-module-loader] Detected SCSS entry files in modules, but `sass` is not installed at project root. Skipping SCSS inputs.');
        }
    }

    return uniqueOrdered;
}

