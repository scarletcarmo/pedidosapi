<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class FacturaDetalle extends Model
{
    protected $table = 'factura_detalle';
    public $timestamps = false;
    protected $fillable = [
        'cantidad',
        'precio',
        'total',
        'factura_id',
        'articulo_id',
    ];

    public function Factura(){
        return $this->belongsTo('App\Factura');
    }

    public function Articulo(){
        return $this->belongsTo('App\Articulo');
    }
}