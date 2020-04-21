<?php

namespace App\Http\Controllers;
use App\FacturaDetalle;
use Illuminate\Http\Request;

class FacturaDetalleController extends Controller
{
    public function index()
    {
        $detalle = DetalleFactura::get();
        return Response()->json($detalle, 200);
    }

    public function getAllByFactura($factura_id)
    {
        $detalles = DetalleFactura::where('factura_id', $factura_id)->get();
        foreach($detalles as $detalle)$detalle->factura;
        return Response()->json($detalle, 200);
    }

    public function store(Request $request)
    {
        $input = $request->all();
        //$cantidades = $input['cantidad'];
        //$factura_id = $input['factura_id'];
        //print_r($factura_id); die();
        /*foreach($cantidades as $cantidad){
            $dato = [
                'cantidad' => $cantidad,
                'precio' => $input['precio'],
                'total' => $input['total'],
                'factura_id' => $factura_id,
            ]; 
            $detalle = Detallefactura::create($dato);
        }*/
        $detalle = FacturaDetalle::create($input);
        return Response()->json($detalle, 201);
    }
}
