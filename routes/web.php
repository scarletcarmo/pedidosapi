<?php

$router->get('usuarios', 'UsuarioController@index');
$router->get('usuarios/{id}', 'UsuarioController@getById');
$router->post('usuarios', 'UsuarioController@store');

$router->post('articulos', 'ArticuloController@store');
$router->get('articulos', 'ArticuloController@index');
$router->get('articulos/{id}', 'ArticuloController@getById');

$router->post('facturas', 'FacturaController@store');
$router->get('facturas', 'FacturaController@index');
$router->get('usuarios/{usuario_id}/facturas', 'FacturaController@getAllByUsuario');
$router->get('facturas/{id}', 'FacturaController@getById');
$router->post('pedidos/facturas', 'FacturaController@storeByPedidos');

$router->get('detallefacturas', 'DetalleFacturaController@index');
$router->get('facturas/{factura_id}/detallefacturas', 'DetalleFacturaController@getAllByFactura');
$router->post('detallefacturas', 'DetalleFacturaController@store');

$router->get('pedidos', 'PedidoController@index');
$router->get('facturas/{factura_id}/pedidos', 'PedidoController@getAllByFactura');
$router->get('usuarios/{usuario_id}/pedidos', 'PedidoController@getAllByUsuario');
$router->post('pedidos','PedidoController@store');