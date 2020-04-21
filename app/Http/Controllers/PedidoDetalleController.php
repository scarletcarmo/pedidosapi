<?php

namespace App\Http\Controllers;

use App\PedidoDetalle;
//use App\Pedido;

use Illuminate\Http\Request;

class PedidoDetalleController extends Controller
{
    public function getAllByArticulos($articulo_id)
    {
        $detalles = PedidoDetalle::where('articulo_id', $articulo_id)->get();
        foreach($detalles as $detalle)$detalle->articulo;
        return Response()->json($detalle, 200);
    }
    public function store(Request $request)
    {
        $input = $request->all();
        /*foreach($pedidosdetalles as $pedidos)
        {
            $data = [
                'cantidad' => $cantidad,
                'precio' => $input['precio'],
                'pedido_id' => $pedidos,
                'articulo_id' => $articulo_id,
            ]; 
        }*/
        $detalle = PedidoDetalle::create($input);
        return Response()->json($detalle, 201);
    }
}
