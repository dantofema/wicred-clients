<?php

declare(strict_types=1);

namespace Modules\Alprestamo\Enums;

enum EmploymentStatus: string
{
    case Employed = 'E';
    case GovernmentEmployee = 'G';
    case SelfEmployed = 'I';
}
