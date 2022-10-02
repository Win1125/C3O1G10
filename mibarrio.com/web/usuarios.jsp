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
        <title>Usuarios</title>
       // <style>
           div{
         //       border: solid 2px;
       //     }
       // </style>
    </head>
    <body>
        <div class="container-fluid"ng-app="usuarios" ng-controller="usuariosController as u">

            <div class="row">
                <div class="col-6">
                    <h3>USUARIO</h3>

                    <div class="row">
                        <div class="col-6">
                            <label>id Usuario</label>
                            <input type="text" class="form-control"ng-model="u.idUsuario">
                        </div>
                        <div class="col-6">
                            <label>Tip Documento</label>
                            <input type="text" class="form-control"ng-model="u.tipoDocumeto">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <label>Documento</label>
                            <input type="text" class="form-control"ng-model="u.numeroDeDocumento">
                        </div>
                        <div class="col-6">
                            <label>Nombres</label>
                            <input type="text" class="form-control"ng-model="u.nombres">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <label>Apellidos</label>
                            <input type="text" class="form-control"ng-model="u.apellidos">
                        </div>
                        <div class="col-6">
                            <label>Celular</label>
                            <input type="text" class="form-control"ng-model="u.celular">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <label>Tipo Usuario</label>
                            <input type="text" class="form-control"ng-model="u.tipoUsuario">
                        </div>
                        <div class="col-6">
                            <label>Correo</label>
                            <input type="text" class="form-control"ng-model="u.correo">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <label>Contraseña</label>
                            <input type="text" class="form-control"ng-model="u.contrasena">
                        </div>
                        
                    </div>
                    <div class="row">
                        <div class="col-3">
                            <button type="button" class="btn btn-success"ng-click="u.guardar()">Guardar</button>
                        </div>
                        <div class="col-3">
                            <button type="button" class="btn btn-primary" ng-click="u.consultar()">Consultar</button>
                        </div>
                        <div class="col-3">
                            <button type="button" class="btn btn-warning"ng-click="u.actualizar()">Actualizar</button>
                        </div>
                        <div class="col-3">
                            <button type="button" class="btn btn-danger"ng-click="u.eliminar()">Eliminar</button>
                        </div>
                    </div>
                </div>
                <div class="col-6">
                    <h3>Tabla</h3>
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">idUsu</th>
                                <th scope="col">tipoDoc</th>
                                <th scope="col">numDoc</th>
                                <th scope="col">nombres</th>
                                <th scope="col">apellidos</th>
                                <th scope="col">celular</th>
                                <th scope="col">tipUsua</th>
                                <th scope="col">correo</th>
                                <th scope="col">contrasena</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr ng-repeat="px in u.usuarios">
                                <th>{{px.idUsuario}}</th>
                                <td>{{px.tipoDocumento}}</td>
                                <td>{{px.numeroDeDocumento}}</td>
                                <td>{{px.nobres}}</td>
                                <th>{{px.apellidos}}</th>
                                <td>{{px.celular}}</td>
                                <td>{{px.tipoUsuario}}</td>
                                <td>{{px.correo}}</td>
                                <td>{{px.contrasena}}</td>
                            </tr>


                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <script>
            var app = angular.module('usuarios', []);
            app.controller('usuariosController', ['$http', controladorUsuarios]);
            function controladorUsuarios($http) {
                var u = this;
                u.consultar = function () {
                    var parametros = {
                        proceso: 'listar'

                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesUsuarios.jsp',
                        params: parametros
                    }).then(function (resp) {
                        u.usuarios = resp.data.usuarios;
                    });
                };
                u.gurdar = function () {
                    var parametros = {
                        proceso: 'guardar',
                        idUsuario: u.idUsuario,
                        tipoDocumento: u.tipoDocumento,
                        numeroDeDocumento: u.numeroDeDocumento,
                        nombres: u.nombres,
                        apellidos: u.apellidos,
                        celular: u.celular,
                        tipoUsuario: u.tipoUsuario,
                        correo:u.correo,
                        contrasena:u.contrasena
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesUsuarios.jsp',
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
                u.actualizar = function () {
                    var parametros = {
                        proceso: 'actualizar',
                        idUsuario: u.idUsuario,
                        tipoDocumento: u.tipoDocumento,
                        numeroDeDocumento: u.numeroDeDocumento,
                        nombres: u.nombres,
                        apellidos: u.apellidos,
                        celular: u.celular,
                        tipoUsuario: u.tipoUsuario,
                        correo:u.correo,
                        contrasena:u.contrasena
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesUsuarios.jsp',
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
                u.eliminar = function () {
                    var parametros = {
                        proceso: 'eliminar',
                        idProducto: u.idUsuario

                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesUsuarios.jsp',
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

