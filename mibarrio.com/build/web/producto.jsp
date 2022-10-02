<%-- 
    Document   : producto
    Created on : 19/09/2022, 10:44:38 PM
    Author     : USUARIO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
        <title>Producto</title>
       // <style>
           div{
         //       border: solid 2px;
       //     }
       // </style>
    </head>
    <body>
        <div class="container-fluid"ng-app="producto" ng-controller="productoController as p">

            <div class="row">
                <div class="col-6">
                    <h3>PRODUCTO</h3>

                    <div class="row">
                        <div class="col-6">
                            <label>id Producto</label>
                            <input type="text" class="form-control"ng-model="p.idProdcto">
                        </div>
                        <div class="col-6">
                            <label>nombre Producto</label>
                            <input type="text" class="form-control"ng-model="p.nombreProducto">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <label>Fecha de Compras</label>
                            <input type="text" class="form-control"ng-model="p.fechaCompra">
                        </div>
                        <div class="col-6">
                            <label>Fecha de Vencimiento</label>
                            <input type="text" class="form-control"ng-model="p.fechaVencimiento">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <label>Lote</label>
                            <input type="text" class="form-control"ng-model="p.lote">
                        </div>
                        <div class="col-6">
                            <label>Precio Base</label>
                            <input type="text" class="form-control"ng-model="p.precioBase">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <label>Precio Venta</label>
                            <input type="text" class="form-control"ng-model="p.precioVenta">
                        </div>
                        <div class="col-6">
                            <label>Id Proveedor</label>
                            <input type="text" class="form-control"ng-model="p.idProveedor">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-3">
                            <button type="button" class="btn btn-success"ng-click="p.guardar()">Guardar</button>
                        </div>
                        <div class="col-3">
                            <button type="button" class="btn btn-primary" ng-click="p.consultar()">Consultar</button>
                        </div>
                        <div class="col-3">
                            <button type="button" class="btn btn-warning"ng-click="p.actualizar()">Actualizar</button>
                        </div>
                        <div class="col-3">
                            <button type="button" class="btn btn-danger"ng-click="p.eliminar()">Eliminar</button>
                        </div>
                    </div>
                </div>
                <div class="col-6">
                    <h3>Tabla</h3>
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">idProd</th>
                                <th scope="col">NomPro</th>
                                <th scope="col">FecCom</th>
                                <th scope="col">FecVen</th>
                                <th scope="col">Lote</th>
                                <th scope="col">PreBas</th>
                                <th scope="col">PreVen</th>
                                <th scope="col">IdProv</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr ng-repeat="px in p.producto">
                                <th>{{px.idProducto}}</th>
                                <td>{{px.nombreProducto}}</td>
                                <td>{{px.fechaCompra}}</td>
                                <td>{{px.fechaVencimiento}}</td>
                                <th>{{px.lote}}</th>
                                <td>{{px.precioBase}}</td>
                                <td>{{px.precioVenta}}</td>
                                <td>{{px.idProveedor}}</td>
                            </tr>


                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <script>
            var app = angular.module('producto', []);
            app.controller('productoController', ['$http', controladorProducto]);
            function controladorProducto($http) {
                var p = this;
                p.consultar = function () {
                    var parametros = {
                        proceso: 'listar'

                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesProducto.jsp',
                        params: parametros
                    }).then(function (resp) {
                        p.producto = resp.data.producto;
                    });
                };
                p.gurdar = function () {
                    var parametros = {
                        proceso: 'guardar',
                        idProducto: p.idProducto,
                        nombreProducto: p.nombreProducto,
                        fechaCompra: p.fechaCompra,
                        fechaVencimiento: p.fechaVencimiento,
                        lote: p.lote,
                        precioBase: p.precioBase,
                        precioVenta: p.precioVenta,
                        idProveedor: p.idProveedor
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesProducto.jsp',
                        params: parametros
                    }).then(function (resp) {
                        if (resp.data.ok === true) {
                            if (resp.data.guardar === true) {
                                alert('Guardo');
                            } else {
                                alert('No Guardo');
                            }
                        } else {
                            alert(resp.data.errorMsg);
                        }
                    });
                };
                p.actualizar = function () {
                    var parametros = {
                        proceso: 'actualizar',
                        idProducto: p.idProducto,
                        nombreProducto: p.nombreProducto,
                        fechaCompra: p.fechaCompra,
                        fechaVencimiento: p.fechaVencimiento,
                        lote: p.lote,
                        precioBase: p.precioBase,
                        precioVenta: p.precioVenta,
                        idProveedor: p.idProveedor
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesProducto.jsp',
                        params: parametros
                    }).then(function (resp) {
                        if (resp.data.ok === true) {
                            if (resp.data.actualizar === true) {
                                alert('Actualizo');
                            } else {
                                alert('No Actualizo');
                            }
                        } else {
                            alert(resp.data.errorMsg);
                        }
                    });

                };
                p.eliminar = function () {
                    var parametros = {
                        proceso: 'eliminar',
                        idProducto: p.idProducto,

                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesProducto.jsp',
                        params: parametros
                    }).then(function (resp) {
                        if (resp.data.ok === true) {
                            if (resp.data.eliminar === true) {
                                alert('elimino');
                            } else {
                                alert('No elimino');
                            }
                        } else {
                            alert(resp.data.errorMsg);
                        }
                    });
                };
            }
        </script>
    </body>
</html>
