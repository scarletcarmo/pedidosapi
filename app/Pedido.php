<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Pedido extends Model
{
    protected $table = 'pedido';
    public $timestamps = false;
    protected $fillable = [
        'fecha_pedido',
        'fecha_entrega',
        'precio_total',
        'usuario_id',
    ];

    //public function Usuario(){
     //   return $this->belongsTo('App\Usuario');
    //}

    public function Usuario(){
        return $this->belongsTo('App\Usuario');
    }

    //public function PedidoDetalle(){
      //  return $this->belongsTo('App\PedidoDetalle');
    //}
}