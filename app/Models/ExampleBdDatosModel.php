<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Modelo de ejemplo que utiliza la base de datos 'bd_datos'
 *
 * Para crear modelos que usen esta conexión, simplemente agrega:
 * protected $connection = 'bd_datos';
 */
class ExampleBdDatosModel extends Model
{
    /**
     * La conexión de base de datos que debe usar el modelo.
     *
     * @var string
     */
    protected $connection = 'bd_datos';

    /**
     * La tabla asociada con el modelo.
     *
     * @var string
     */
    protected $table = 'ejemplo';

    /**
     * Los atributos que son asignables en masa.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'nombre',
    ];
}
