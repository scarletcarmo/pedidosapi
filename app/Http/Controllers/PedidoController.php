<?php

namespace App\Http\Controllers;

use App\Pedido;
use App\PedidoDetalle;

use Illuminate\Http\Request;

class PedidoController extends Controller
{
    public function index()
    {
        $pedido = Pedido::get();
        return Response()->json($pedido, 200);
    }

    public function getAllByFactura($factura_id)
    {
        $pedidos = Pedido::where('factura_id', $factura_id)->get();
        foreach($pedidos as $pedido)$pedido->factura;
        $pedido->usuario;
        return Response()->json($pedido, 200);
    }

    public function getAllByUsuario($usuario_id)
    {
        $pedidos = Pedido::where('usuario_id', $usuario_id)->get();
        foreach($pedidos as $pedido)$pedido->usuario;
        return Response()->json($pedidos, 200);
    }

    public function store(Request $request)
    {
        $input = $request->all();
        $detalles = $input['midetalle'];
        $pedido = Pedido::create($input); 
        $pedido_id = $pedido['id'];

        // $pedido = $pedido->toArray();
        foreach($detalles as $detalle)
        {
            $data = [
                'cantidad' => $detalle['cantidad'],
                'precio' => $detalle['precio'], 
                'total' => $detalle['total'],
                'pedido_id' => $pedido_id,
                'articulo_id' => $detalle['articulo_id'],
            ];

            // $detalle['pedido_id'] = $pedido_id;
            $detallepedido = PedidoDetalle::create($data);
            // $pedido['detalle'][] = $detallepedido;
        }
        return Response()->json($pedido, 201);  
    }
}
