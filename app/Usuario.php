<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Usuario extends Model
{
    protected $table = 'usuario';
    public $timestamps = false;
    protected $fillable = [
        'nombre',
        'correo',
    ];

    public function Pedido()
    {
        return $this->hasMany('App\Pedido');
    }
}