<%-- 
    Document   : autores
    Created on : 13/09/2022, 06:38:12 AM
    Author     : Edwin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
        <title>Ventas</title>
    </head>
    <body>
        <div class="container-fluid" ng-app="ventas" ng-controller="ventasController as v">
            <div class="row">
                <div class="col-4">
                    <h1>Formulario</h1>
                    <div class="row">
                        <div class="col-6">
                            <div class="form-group">
                                <label>ID Venta</label>
                                <input type="text" class="form-control" id="idUsuario" ng-model="v.idVentas" required title="El campo no puede estar vacío">
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group">
                                <label>ID Cliente*</label>
                                <input type="text" class="form-control" id="nombreUsuario" ng-model="v.fk_idUsuario" required title="El campo no puede estar vacío">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <div class="form-group">
                                <label>ID Producto*</label>
                                <input type="text" class="form-control" id="documentoUsuario" ng-model="v.fk_idProducto" required title="El campo no puede estar vacío">
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group">
                                <label>Fecha Venta*</label>
                                <input type="date" class="form-control" id="correoUsuario" ng-model="v.fechaVenta" required title="El campo no puede estar vacío">  
                            </div>

                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <label>Precio Final*</label>
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">$</span>
                                </div>
                                <input type="text" class="form-control" ng-model="v.precioFinal" required title="El campo no puede estar vacío">
                                <div class="input-group-append">
                                    <span class="input-group-text">.00</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-3">
                            <button type="button" class="btn btn-primary" ng-click="v.consultar()">Consultar</button>
                        </div>
                        <div class="col-3">
                            <button type="button" class="btn btn-success" ng-click="v.guardar()">Guardar</button>
                        </div>
                        <div class="col-3">
                            <button type="button" class="btn btn-warning" ng-click="v.actualizar()">Actualizar</button>
                        </div>
                        <div class="col-3">
                            <button type="button" class="btn btn-danger"  ng-click="v.eliminar()">Eliminar</button>
                        </div>
                    </div>
                </div>
                <div class="col-8">
                    <h1>VENTAS</h1>
                    <table class="table">
                        <thead class="thead-dark">
                            <tr>
                                <th scope="col">ID Ventas</th>
                                <th scope="col">ID Cliente</th>
                                <th scope="col">ID Producto</th>
                                <th scope="col">Precio Final</th>
                                <th scope="col">Fecha Venta</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr ng-repeat="vn in v.ventas">
                                <td>{{vn.idVentas}}</td>
                                <td>{{vn.fk_idUsuario}}</td>
                                <td>{{vn.fk_idProducto}}</td>
                                <td>{{vn.precioFinal}}</td>
                                <td>{{vn.fechaVenta}}</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <script>
            var app=angular.module('ventas',[]);
            app.controller('ventasController', ['$http', controladorVentas]);
            function controladorVentas($http){
                var vn = this;
                
                vn.consultar=function(){
                    var parametros={
                      proceso:'listar'  
                    };
                    $http({
                       method: 'POST',
                       url: 'peticionesVenta.jsp',
                       params: parametros
                    }).then(function(resp){
                        vn.ventas = resp.data.ventas;
                    });
                    
                };
                
                vn.guardar=function(){
                    var parametros={
                        proceso:'guardar',                       
                        idVentas: vn.idVentas,
                        fk_idProducto: vn.fk_idProducto,
                        fk_idUsuario: vn.fk_idUsuario,
                        precioFinal: vn.precioFinal,
                        fechaVenta: vn.fechaVenta
                    };
                    $http({
                        method:'POST',
                        url:'peticionesVenta.jsp',
                        params:parametros
                    }).then(function(resp){
                        if(resp.data.ok===true){
                            if(resp.data.guardar===true){
                                alert('Guardó');
                            }else{
                                alert('No Guardó');
                            }
                            
                        }else{
                            alert(resp.data.errorMsg);
                        }
                    });
                };
                
                vn.actualizar=function(){
                    var parametros={
                        proceso:'actualizar',
                        idVentas: vn.idVentas,
                        fk_idProducto: vn.fk_idProducto,
                        fk_idUsuario: vn.fk_idUsuario,
                        precioFinal: vn.precioFinal,
                        fechaVenta: vn.fechaVenta
                    };
                    $http({
                        method:'POST',
                        url:'peticionesVenta.jsp',
                        params:parametros
                    }).then(function(resp){
                        if(resp.data.ok===true){
                            if(resp.data.actualizar===true){
                                alert('Actualizó');
                            }else{
                                alert('No Actualizó');
                            }
                            
                        }else{
                            alert(resp.data.errorMsg);
                        }
                    });
                };
                
                vn.eliminar=function(){
                    var parametros = {
                        proceso: 'eliminar',
                        idVentas: vn.idVentas
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesVenta.jsp',
                        params: parametros
                    }).then(function (resp) {
                        if (resp.data.ok === true) {
                            if (resp.data.eliminar === true) {
                                alert('Eliminó');
                            } else {
                                alert('No Eliminó');
                            }

                        } else {
                            alert(resp.data.errorMsg);
                        }
                    });
                };
            };   
        </script>    
    </body>
</html>
