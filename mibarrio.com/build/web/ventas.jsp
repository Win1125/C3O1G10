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
        <title>Ventas</title>
        // <style>
            div{
                //       border: solid 2px;
                //     }
                // </style>
        </head>
        <body>
            <div class="container-fluid"ng-app="ventas" ng-controller="productoController as v">

                <div class="row">
                    <div class="col-6">
                        <h3>VENTAS</h3>

                        <div class="row">
                            <div class="col-6">
                                <label>id Ventas</label>
                                <input type="text" class="form-control"ng-model="v.idVentas">
                            </div>
                            <div class="col-6">
                                <label>id Producto</label>
                                <input type="text" class="form-control"ng-model="v.idProducto">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-6">
                                <label>id Usuario</label>
                                <input type="text" class="form-control"ng-model="v.idUsuario">
                            </div>
                            <div class="col-6">
                                <label>Precio Final</label>
                                <input type="text" class="form-control"ng-model="v.precioFinal">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-6">
                                <label>Precio Final</label>
                                <input type="text" class="form-control"ng-model="v.precioFinal">
                            </div>

                        </div>

                        <div class="row">
                            <div class="col-3">
                                <button type="button" class="btn btn-success"ng-click="v.gurdar()">Guardar</button>
                            </div>
                            <div class="col-3">
                                <button type="button" class="btn btn-primary" ng-click="v.consultar()">Consultar</button>
                            </div>
                            <div class="col-3">
                                <button type="button" class="btn btn-warning"ng-click="v.actualizar()">Actualizar</button>
                            </div>
                            <div class="col-3">
                                <button type="button" class="btn btn-danger"ng-click="v.eliminar()">Eliminar</button>
                            </div>
                        </div>
                    </div>
                    <div class="col-6">
                        <h3>Tabla</h3>
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">idVentas</th>
                                    <th scope="col">idProducto</th>
                                    <th scope="col">idUsuario</th>
                                    <th scope="col">precioFinal</th>
                                    <th scope="col">fechaVenta</th>

                                </tr>
                            </thead>
                            <tbody>
                                <tr ng-repeat="px in v.ventas">
                                    <th>{{px.idVentas}}</th>
                                    <td>{{px.idProducto}}</td>
                                    <td>{{px.idUsuario}}</td>
                                    <td>{{px.precioFinal}}</td>
                                    <th>{{px.fechaVenta}}</th>
                                    
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
                    var v = this;
                    v.consultar = function () {
                        var parametros = {
                            proceso: 'listar'

                        };
                        $http({
                            method: 'POST',
                            url: 'peticionesVentas.jsp',
                            params: parametros
                        }).then(function (resp) {
                            v.ventas = resp.data.producto;
                        });
                    };
                    v.gurdar = function () {
                        var parametros = {
                            proceso: 'guardar',
                            idVentas: v.idVentas,
                            idProducto: v.idProducto,
                            idUsuario: v.idUsuario,
                            precioFinal: v.precioFinal,
                            fechaVenta: v.fechaVenta
                            
                        };
                        $http({
                            method: 'POST',
                            url: 'peticionesVentas.jsp',
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
                    v.actualizar = function () {
                        var parametros = {
                            proceso: 'actualizar',
                            idVentas: v.idVentas,
                            idProducto: v.idProducto,
                            idUsuario: v.idUsuario,
                            precioFinal: v.precioFinal,
                            fechaVenta: v.fechaVenta
                        };
                        $http({
                            method: 'POST',
                            url: 'peticionesVentas.jsp',
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
                    v.eliminar = function () {
                        var parametros = {
                            proceso: 'eliminar',
                            idVentas: v.idVentas,

                        };
                        $http({
                            method: 'POST',
                            url: 'peticionesVentas.jsp',
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
