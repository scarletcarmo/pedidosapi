<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Factura extends Model
{
    protected $table = 'factura';
    public $timestamps = false;
    protected $fillable = [
        'establecimiento',
        'punto_emision',
        'secuencial',
        'fecha_emision',
        'total',
        'usuario_id'
    ];

    public function Pedido()
    {
        return $this->hasMany('App\Pedido');
    }

    public function Usuario(){
        return $this->belongsTo('App\Usuario');
    }
}