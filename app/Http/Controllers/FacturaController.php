<?php

namespace App\Http\Controllers;
use App\Factura;
use App\PedidoDetalle;
use App\FacturaDetalle;
use Illuminate\Http\Request;

class FacturaController extends Controller
{
    public function index(){
        $facturas = Factura::get();
        return Response()->json($facturas, 200);
    }

    public function getById($id){
        $factura = Factura::find($id);  
        return Response()->json($factura, 200);
    }

    public function store(Request $request)
    {
        $input = $request->all();
        $detalles = $request['detalle']; 
        $factura = Factura::create($input);
        
        foreach($detalles as $detalle)
        {
            $data = [
               'cantidad' => $detalle['cantidad'],
               'precio' => $detalle['precio'],
               'total' => $detalle['total'],
               'articulo_id' => $detalle['articulo_id'],
               'factura_id' => $factura['id'],      
            ];
            FacturaDetalle::create($data); 
        }
     return Response()->json($factura, 201);   
    }

    public function storeByPedidos(Request $request)
    {
        $input = $request->all();
        $pedidos_id = $input['pedidos'];
        $factura = Factura::create($input);

        $pedido_detalle = PedidoDetalle::whereIn('pedido_id',$pedidos_id)->get();

        foreach($pedido_detalle as $detalle)
        {
           $data = [
               'cantidad' => $detalle['cantidad'],
               'precio' => $detalle['precio'],
               'total' => $detalle['total'],
               'articulo_id' => $detalle['articulo_id'],
               'factura_id' => $factura['id'],
           ]; 
           FacturaDetalle::create($data); 
        }
     return Response()->json($factura, 201);   
    }
}
