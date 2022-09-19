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
        <title>Productos</title>
    </head>
    <body>
        <div class="container-fluid" ng-app="productos" ng-controller="productosController as p">
            <div class="row">
                <div class="col-4">
                    <h1>Formulario</h1>
                    <div class="row">
                        <div class="col-6">
                            <div class="form-group">
                                <label>ID Producto</label>
                                <input type="text" class="form-control" id="idUsuario" ng-model="p.idProducto" required title="El campo no puede estar vacío">
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group">
                                <label>Nombre Producto*</label>
                                <input type="text" class="form-control" id="nombreUsuario" ng-model="p.nombreProducto" required title="El campo no puede estar vacío">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <div class="form-group">
                                <label>Fecha Compra*</label>
                                <input type="date" class="form-control" id="apellidoUsuario" ng-model="p.fechaCompra" required title="El campo no puede estar vacío">
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group">
                                <label>Fecha Vencimiento*</label>
                                <input type="date" class="form-control" id="tipoDocumentoUsuario" ng-model="p.fechaVencimiento" required title="El campo no puede estar vacío">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <div class="form-group">
                                <label>Precio Venta*</label>
                                <input type="text" class="form-control" id="privilegioUsuario" placeholder="0000.00" ng-model="p.precioVenta" required title="El campo no puede estar vacío" pattern="[0-9]">
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group">
                                <label>Precio Base*</label>
                                <input type="text" class="form-control" id="celularUsuario" placeholder="0000.00" ng-model="p.precioBase" required title="El campo no puede estar vacío">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <div class="form-group">
                                <label>Lote*</label>
                                <input type="text" class="form-control" id="documentoUsuario" ng-model="p.lote" required title="El campo no puede estar vacío">
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group">
                                <label>ID Proveedor*</label>
                                <input type="email" class="form-control" id="correoUsuario" placeholder="example@correo" ng-model="p.fk_idProveedor" required title="El campo no puede estar vacío">  
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-3">
                            <button type="button" class="btn btn-primary" ng-click="p.consultar()">Consultar</button>
                        </div>
                        <div class="col-3">
                            <button type="button" class="btn btn-success" ng-click="p.guardar()">Guardar</button>
                        </div>
                        <div class="col-3">
                            <button type="button" class="btn btn-warning" ng-click="p.actualizar()">Actualizar</button>
                        </div>
                        <div class="col-3">
                            <button type="button" class="btn btn-danger"  ng-click="p.eliminar()">Eliminar</button>
                        </div>
                    </div>
                </div>
                <div class="col-8">
                    <h1>PRODUCTO</h1>
                    <table class="table">
                        <thead class="thead-dark">
                            <tr>
                                <th scope="col">ID Producto</th>
                                <th scope="col">Nombre</th>
                                <th scope="col">Fecha Compra</th>
                                <th scope="col">Fecha Vencimiento</th>
                                <th scope="col">Lote</th>
                                <th scope="col">Precio Base</th>
                                <th scope="col">Precio Venta</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr ng-repeat="pd in p.productos">
                                <td>{{pd.idProducto}}</td>
                                <td>{{pd.nombreProducto}}</td>
                                <td>{{pd.fechaCompra}}</td>
                                <td>{{pd.fechaVencimiento}}</td>
                                <td>{{pd.lote}}</td>
                                <td>{{pd.precioBase}}</td>
                                <td>{{pd.precioVenta}}</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <script>
            var app=angular.module('productos',[]);
            app.controller('productosController', ['$http', controladorProductos]);
            function controladorProductos($http){
                var pd = this;
                
                pd.consultar=function(){
                    var parametros={
                      proceso:'listar'  
                    };
                    $http({
                       method:'POST',
                       url:'peticionesProducto.jsp',
                       params: parametros
                    }).then(function(resp){
                        pd.productos = resp.data.productos;
                    });
                    
                };
                
                pd.guardar=function(){
                    var parametros={
                        proceso:'guardar',
                        idProducto: pd.idProducto,
                        nombreProducto: pd.nombreProducto,
                        fechaCompra: pd.fechaCompra,
                        fechaVencimiento: pd.fechaVencimiento,
                        lote: pd.lote,
                        precioBase: pd.precioBase,
                        precioVenta: pd.precioVenta,
                        fk_idProveedor: pd.fk_idProveedor
                    };
                    $http({
                        method:'POST',
                        url:'peticionesProducto.jsp',
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
                
                pd.actualizar=function(){
                    var parametros={
                        proceso:'actualizar',
                        idProducto: pd.idProducto,
                        nombreProducto: pd.nombreProducto,
                        fechaCompra: pd.fechaCompra,
                        fechaVencimiento: pd.fechaVencimiento,
                        lote: pd.lote,
                        precioBase: pd.precioBase,
                        precioVenta: pd.precioVenta,
                        fk_idProveedor: pd.fk_idProveedor
                    };
                    $http({
                        method:'POST',
                        url:'peticionesProducto.jsp',
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
                
                pd.eliminar=function(){
                    var parametros = {
                        proceso: 'eliminar',
                        idProducto: pd.idProducto
                    };
                    $http({
                        method:'POST',
                        url:'peticionesProducto.jsp',
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
