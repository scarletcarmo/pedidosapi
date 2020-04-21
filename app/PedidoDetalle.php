<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class PedidoDetalle extends Model
{
    protected $table = 'pedido_detalle';
    public $timestamps = false;
    protected $fillable = [
        'cantidad',
        'precio',
        'total',
        'articulo_id',
        'pedido_id',
    ];

    public function Articulo(){
        return $this->belongsTo('App\Articulo');
    }

    public function Pedido(){
        return $this->belongsTo('App\Pedido');
    }
}