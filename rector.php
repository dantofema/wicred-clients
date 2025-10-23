<?php

declare(strict_types=1);

use Rector\Config\RectorConfig;
use Rector\Set\ValueObject\LevelSetList;

return static function (RectorConfig $rectorConfig): void {
    $rectorConfig->paths([
        __DIR__ . '/app',
        __DIR__ . '/Modules',
        __DIR__ . '/config',
        __DIR__ . '/database',
        __DIR__ . '/routes',
        __DIR__ . '/tests',
    ]);

    // Target project PHP version (PHP 8.4)
    $rectorConfig->phpVersion(80400);

    // Apply safe PHP upgrades up to PHP 8.4
    $rectorConfig->sets([
        LevelSetList::UP_TO_PHP_84,
    ]);

    // You can exclude paths or specific rules here if needed, e.g.:
    // $rectorConfig->skip([
    //     __DIR__ . '/bootstrap',
    //     __DIR__ . '/storage',
    // ]);
};
