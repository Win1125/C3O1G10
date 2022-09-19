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
        <title>Proveedores</title>
    </head>
    <body>
        <div class="container-fluid" ng-app="proveedores" ng-controller="proveedoresController as pr">
            <div class="row">
                <div class="col-4">
                    <h1>Formulario</h1>
                    <div class="row">
                        <div class="col-6">
                            <div class="form-group">	
                                <label>ID</label>
                                <input type="text" class="form-control" id="idProveedor" ng-model="pr.idProveedor" required title="El campo no puede estar vacío">
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group">
                                <label>Nombre*</label>
                                <input type="text" class="form-control" id="nombreProveedor" ng-model="pr.nombreProveedor" required title="El campo no puede estar vacío">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <div class="form-group">
                                <label>Contacto*</label>
                                <input type="text" class="form-control" id="contacto" ng-model="pr.contacto" required title="El campo no puede estar vacío">
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group">
                                <label>Correo*</label>
                                <input type="text" class="form-control" id="correo" ng-model="pr.correo" required title="El campo no puede estar vacío">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <div class="form-group">
                                <label>NIT*</label>
                                <input type="text" class="form-control" id="nit" ng-model="pr.nit" required title="El campo no puede estar vacío">
                            </div>
                        </div>
                        <div class="col-6"></div>
                    </div>
                    <div class="row">
                        <div class="col-3">
                            <button type="button" class="btn btn-primary" ng-click="pr.consultar()">Consultar</button>
                        </div>
                        <div class="col-3">
                            <button type="button" class="btn btn-success" ng-click="pr.guardar()">Guardar</button>
                        </div>
                        <div class="col-3">
                            <button type="button" class="btn btn-warning" ng-click="pr.actualizar()">Actualizar</button>
                        </div>
                        <div class="col-3">
                            <button type="button" class="btn btn-danger" ng-click="pr.eliminar()">Eliminar</button>
                        </div>
                    </div>
                </div>
                <div class="col-8">
                    <h1>PROVEEDORES</h1>
                    <table class="table">
                        <thead class="thead-dark">
                            <tr>
                                <th scope="col">ID Proveedor</th>
                                <th scope="col">Nombre</th>
                                <th scope="col">Contacto</th>
                                <th scope="col">Correo</th>
                                <th scope="col">NIT</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr ng-repeat="p in pr.proveedores">
                                <td>{{p.idProveedor}}</td>
                                <td>{{p.nombreProveedor}}</td>
                                <td>{{p.contacto}}</td>
                                <td>{{p.correo}}</td>
                                <td>{{p.nit}}</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <script>
            var app=angular.module('proveedores',[]);
            app.controller('proveedoresController', ['$http', controladorProveedores]);
            function controladorProveedores($http){
                var pr = this;
                
                pr.consultar=function(){
                    var parametros={
                      proceso:'listar'  
                    };
                    $http({
                       method:'POST',
                       url:'peticionesProveedor.jsp',
                       params: parametros
                    }).then(function(resp){
                        pr.proveedores = resp.data.proveedores;
                    });
                    
                };
                
                pr.guardar=function(){
                    var parametros={
                        proceso:'guardar',
                        idProveedor:pr.idProveedor,
                        nombreProveedor:pr.nombreProveedor,
                        contacto:pr.contacto,
                        correo:pr.correo,
                        nit:pr.nit
                    };
                    $http({
                        method:'POST',
                        url:'peticionesProveedor.jsp',
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
                
                pr.actualizar=function(){
                    var parametros={
                        proceso:'actualizar',
                        idProveedor:pr.idProveedor,
                        nombreProveedor:pr.nombreProveedor,
                        contacto:pr.contacto,
                        correo:pr.correo,
                        nit:pr.nit
                    };
                    $http({
                        method:'POST',
                        url:'peticionesProveedor.jsp',
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
                
                pr.eliminar=function(){
                    var parametros = {
                        proceso: 'eliminar',
                        idProveedor:pr.idProveedor
                    };
                    $http({
                        method:'POST',
                        url:'peticionesProveedores.jsp',
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
