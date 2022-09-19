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
        <link rel="stylesheet" href="css/usuario.css">
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
        <title>Usuarios</title>
    </head>
    <body>
        <div class="container-fluid" ng-app="usuarios" ng-controller="usuariosController as u">
            <div class="row">
                <div class="col-4">
                    <h1>Formulario</h1>
                    <div class="row">
                        <div class="col-6">
                            <div class="form-group">
                                <label>ID</label>
                                <input type="text" class="form-control" id="idUsuario" ng-model="u.idUsuario" required title="El campo no puede estar vacío">
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group">
                                <label>Nombres*</label>
                                <input type="text" class="form-control" id="nombreUsuario" ng-model="u.nombres" required title="El campo no puede estar vacío">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <div class="form-group">
                                <label>Apellidos*</label>
                                <input type="text" class="form-control" id="apellidoUsuario" ng-model="u.apellidos" required title="El campo no puede estar vacío">
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group">
                                <label>Tipo Documento*</label>
                                <!--
                                <select class="form-control" id="tipoDocumentoUsuario">
                                    <option>Seleccionar</option>
                                    <option>CC</option>
                                    <option>TI</option>
                                    <option>PEP</option>
                                </select>
                                -->
                                <input type="text" class="form-control" id="tipoDocumentoUsuario" ng-model="u.tipoDocumento" required title="El campo no puede estar vacío">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <div class="form-group">
                                <label># Documento*</label>
                                <input type="text" class="form-control" id="documentoUsuario" ng-model="u.numeroDocumento" required title="El campo no puede estar vacío">
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group">
                                <label>Celular*</label>
                                <input type="text" class="form-control" id="celularUsuario" ng-model="u.celular" required title="El campo no puede estar vacío">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <div class="form-group">
                                <label>Privilegio*</label>
                                <!--
                                <select class="form-control" id="privilegioUsuario">
                                    <option>Seleccionar</option>
                                    <option>Admin</option>
                                    <option>Empleado</option>
                                </select>
                                -->
                                <input type="text" class="form-control" id="privilegioUsuario" ng-model="u.privilegioUsuario" required title="El campo no puede estar vacío" pattern="[0-9]">
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group">
                                <label>Correo*</label>
                                <input type="email" class="form-control" id="correoUsuario" placeholder="example@correo" ng-model="u.correo" required title="El campo no puede estar vacío">  
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <div class="form-group">
                                <label>Contraseña*</label>
                                <input type="password" class="form-control" id="nombreUsuario" ng-model="u.password" required title="El campo no puede estar vacío">
                                <small class="form-text text-muted">No comparta su contraseña con nadie.</small>
                            </div>  
                        </div>
                        <div class="col-6"></div>
                    </div>
                    <div class="row">
                        <div class="col-3">
                            <button type="button" class="btn btn-primary" ng-click="u.consultar()">Consultar</button>
                        </div>
                        <div class="col-3">
                            <button type="button" class="btn btn-success" ng-click="u.guardar()">Guardar</button>
                        </div>
                        <div class="col-3">
                            <button type="button" class="btn btn-warning" ng-click="u.actualizar()">Actualizar</button>
                        </div>
                        <div class="col-3">
                            <button type="button" class="btn btn-danger" ng-click="u.eliminar()">Eliminar</button>
                        </div>
                    </div>
                </div>
                <div class="col-8">
                    <h1>USUARIOS</h1>
                    <table class="table">
                        <thead class="thead-dark">
                            <tr>
                                <th scope="col">ID Usuario</th>
                                <th scope="col">Nombre</th>
                                <th scope="col">Documento</th>
                                <th scope="col">Celular</th>
                                <th scope="col">Privilegio</th>
                                <th scope="col">Correo</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr ng-repeat="us in u.usuarios">
                                <td>{{us.idUsuario}}</td>
                                <td>{{us.nombres + " " + us.apellidos}}</td>
                                <td>{{us.tipoDocumento +": "+us.numeroDocumento}}</td>
                                <td>{{us.celular}}</td>
                                <td>{{us.privilegioUsuario}}</td>
                                <td>{{us.correo}}</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>        
        <script>
            var app=angular.module('usuarios',[]);
            app.controller('usuariosController', ['$http', controladorUsuarios]);
            function controladorUsuarios($http){
                var u = this;
                
                u.consultar=function(){
                    var parametros={
                      proceso:'listar'  
                    };
                    $http({
                       method: 'POST',
                       url: 'peticionesUsuario.jsp',
                       params: parametros
                    }).then(function(resp){
                        u.usuarios = resp.data.usuarios;
                    });
                    
                };
                
                u.guardar=function(){
                    var parametros={
                        proceso:'guardar',
                        idUsuario:u.idUsuario,
                        nombres:u.nombres,
                        apellidos:u.apellidos,
                        tipoDocumento:u.tipoDocumento,
                        numeroDocumento:u.numeroDocumento,
                        celular:u.celular,
                        privilegioUsuario:u.privilegioUsuario,
                        correo:u.correo,
                        password:u.password
                    };
                    $http({
                        method:'POST',
                        url:'peticionesUsuario.jsp',
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
                
                u.actualizar=function(){
                    var parametros={
                        proceso:'actualizar',
                        idUsuario:u.idUsuario,
                        nombres:u.nombres,
                        apellidos:u.apellidos,
                        tipoDocumento:u.tipoDocumento,
                        numeroDocumento:u.numeroDocumento,
                        celular:u.celular,
                        privilegioUsuario:u.privilegioUsuario,
                        correo:u.correo,
                        password:u.password
                    };
                    $http({
                        method:'POST',
                        url:'peticionesUsuario.jsp',
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
                
                u.eliminar=function(){
                    var parametros = {
                        proceso: 'eliminar',
                        idUsuario: u.idUsuario
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesUsuario.jsp',
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
