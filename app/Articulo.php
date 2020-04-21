<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Articulo extends Model
{
    protected $table = 'articulo';
    public $timestamps = false;
    protected $fillable = [
        'nombre',
        'descripcion',
        'precio',
        'estado',
    ];

    public function Detalle()
    {
        return $this->hasMany('App\Detalle');
    }
}