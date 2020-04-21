<?php

namespace App\Http\Controllers;
use App\Articulo;
use Illuminate\Http\Request;

class ArticuloController extends Controller
{
    public function index()
    {
        $articulo = Articulo::get();
        return Response()->json($articulo, 201);
    }

    public function getById($id)
    {
        $articulo = Articulo::find($id);
        return Response()->json($articulo, 201);
    }

    public function store(Request $request)
    {   
        $input = $request->all();
        $articulo = Articulo::create($input);
        return Response()->json($articulo, 201);
    }
}
