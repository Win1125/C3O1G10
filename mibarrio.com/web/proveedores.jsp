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
        <title>PROVEEDOR</title>
       
    </head>
    <body>
        <div class="container-fluid"ng-app="proveedores" ng-controller="proveedoresController as p">

            <div class="row">
                <div class="col-6">
                    <h3>PROVEEDOR</h3>

                    <div class="row">
                        <div class="col-6">
                            <label>id Proveedor</label>
                            <input type="text" class="form-control"ng-model="p.idProveedor">
                        </div>
                        <div class="col-6">
                            <label>nombre Proveedor</label>
                            <input type="text" class="form-control"ng-model="p.nombreProveedor">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <label>Contacto</label>
                            <input type="text" class="form-control"ng-model="p.contacto">
                        </div>
                        <div class="col-6">
                            <label>Correo</label>
                            <input type="text" class="form-control"ng-model="p.correo">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <label>Nit</label>
                            <input type="text" class="form-control"ng-model="p.nit">
                        </div>
                        
                    </div>
                    
                    <div class="row">
                        <div class="col-3">
                            <button type="button" class="btn btn-success"ng-click="p.gurdar()">Guardar</button>
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
                                <th scope="col">idProveedor</th>
                                <th scope="col">nombreProveedor</th>
                                <th scope="col">contacto</th>
                                <th scope="col">correo</th>
                                <th scope="col">nit</th>
                                
                            </tr>
                        </thead>
                        <tbody>
                            <tr ng-repeat="px in p.proveedores">
                                <th>{{px.idProveedores}}</th>
                                <td>{{px.nombreProveedores}}</td>
                                <td>{{px.contacto}}</td>
                                <td>{{px.correo}}</td>
                                <th>{{px.nit}}</th>
                                
                            </tr>


                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <script>
            var app = angular.module('proveedores', []);
            app.controller('proveedoresController', ['$http', controladorProveedores]);
            function controladorProveedores($http) {
                var p = this;
                p.consultar = function () {
                    var parametros = {
                        proceso: 'listar'

                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesProveedores.jsp',
                        params: parametros
                    }).then(function (resp) {
                        p.proveedores = resp.data.proveedores;
                    });
                };
                p.gurdar = function () {
                    var parametros = {
                        proceso: 'guardar',
                         idProveedor: p.idProveedor,
                        nombreProveedor: p.nombreProveedor,
                        contacto: p.contacto,
                        correo: p.correo,
                        nit: p.nit
                        
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesProveedores.jsp',
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
                        idProveedor: p.idProveedor,
                        nombreProveedor: p.nombreProveedor,
                        contacto: p.contacto,
                        correo: p.correo,
                        nit: p.nit
                       
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesProveedores.jsp',
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
                        idProducto: p.idProveedor,

                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesProveedores.jsp',
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
