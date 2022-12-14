<%-- 
    Document   : menu
    Created on : 16/09/2022, 07:40:24 PM
    Author     : Edwin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="css/style.css" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <link href="https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css" rel="stylesheet"/>
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
    </head>
    <body>
        <nav>
            <div class="logo">
                <i class="bx bx-menu menu-icon"></i>
                <span class="logo-name">Mi Barrio</span>
            </div>
            <div class="sidebar">
                <div class="logo">
                    <i class="bx bx-menu menu-icon"></i>
                    <span class="logo-name">Mi Barrio</span>
                </div>

                <div class="sidebar-content">
                    <ul class="lists">
                        <li class="list">
                            <a href="#" class="nav-link">
                                <i class="bx bx-home-alt icon"></i>
                                <span class="link">Usuarios</span>
                            </a>
                        </li>
                        <li class="list">
                            <a href="#" class="nav-link">
                                <i class="bx bx-bar-chart-alt-2 icon"></i>
                                <span class="link">Productos</span>
                            </a>
                        </li>
                        <li class="list">
                            <a href="#" class="nav-link">
                                <i class="bx bx-bell icon"></i>
                                <span class="link">Proveedores</span>
                            </a>
                        </li>
                        <li class="list">
                            <a href="#" class="nav-link">
                                <i class="bx bx-message-rounded icon"></i>
                                <span class="link">Ventas</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <section class="overlay"></section>
        
         <div class="container" ng-app="usuarios" ng-controller="usuariosController as u">
                <div class="row">
                    <div class="col-6">
                        <h1>Formulario</h1>
                        <div class="row">
                            <div class="col-6">
                                <div class="form-group">
                                    <label>ID</label>
                                    <input type="text" class="form-control" id="idUsuario" ng-model="u.idUsuario" required title="El campo no puede estar vac??o">
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="form-group">
                                    <label>Nombres*</label>
                                    <input type="text" class="form-control" id="nombreUsuario" ng-model="u.nombres" required title="El campo no puede estar vac??o">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-6">
                                <div class="form-group">
                                    <label>Apellidos*</label>
                                    <input type="text" class="form-control" id="apellidoUsuario" ng-model="u.apellidos" required title="El campo no puede estar vac??o">
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
                                    <input type="text" class="form-control" id="tipoDocumentoUsuario" ng-model="u.tipoDocumento" required title="El campo no puede estar vac??o">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-6">
                                <div class="form-group">
                                    <label># Documento*</label>
                                    <input type="text" class="form-control" id="documentoUsuario" ng-model="u.numeroDocumento" required title="El campo no puede estar vac??o">
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="form-group">
                                    <label>Celular*</label>
                                    <input type="text" class="form-control" id="celularUsuario" ng-model="u.celular" required title="El campo no puede estar vac??o">
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
                                    <input type="text" class="form-control" id="privilegioUsuario" ng-model="u.privilegioUsuario" required title="El campo no puede estar vac??o" pattern="[0-9]">
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="form-group">
                                    <label>Correo*</label>
                                    <input type="email" class="form-control" id="correoUsuario" placeholder="example@correo" ng-model="u.correo" required title="El campo no puede estar vac??o">  
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-6">
                                <div class="form-group">
                                    <label>Contrase??a*</label>
                                    <input type="password" class="form-control" id="nombreUsuario" ng-model="u.password" required title="El campo no puede estar vac??o">
                                    <small class="form-text text-muted">No comparta su contrase??a con nadie.</small>
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
                    <div class="col-6">
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
                            url: 'peticionesUsuario.jsp',
                            params: parametros
                        }).then(function (resp) {
                            u.usuarios = resp.data.usuarios;
                        });

                    };

                    u.guardar = function () {
                        var parametros = {
                            proceso: 'guardar',
                            idUsuario: u.idUsuario,
                            nombres: u.nombres,
                            apellidos: u.apellidos,
                            tipoDocumento: u.tipoDocumento,
                            numeroDocumento: u.numeroDocumento,
                            celular: u.celular,
                            privilegioUsuario: u.privilegioUsuario,
                            correo: u.correo,
                            password: u.password
                        };
                        $http({
                            method: 'POST',
                            url: 'peticionesUsuario.jsp',
                            params: parametros
                        }).then(function (resp) {
                            if (resp.data.ok === true) {
                                if (resp.data.guardar === true) {
                                    alert('Guard??');
                                } else {
                                    alert('No Guard??');
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
                            nombres: u.nombres,
                            apellidos: u.apellidos,
                            tipoDocumento: u.tipoDocumento,
                            numeroDocumento: u.numeroDocumento,
                            celular: u.celular,
                            privilegioUsuario: u.privilegioUsuario,
                            correo: u.correo,
                            password: u.password
                        };
                        $http({
                            method: 'POST',
                            url: 'peticionesUsuario.jsp',
                            params: parametros
                        }).then(function (resp) {
                            if (resp.data.ok === true) {
                                if (resp.data.actualizar === true) {
                                    alert('Actualiz??');
                                } else {
                                    alert('No Actualiz??');
                                }

                            } else {
                                alert(resp.data.errorMsg);
                            }
                        });
                    };

                    u.eliminar = function () {
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
                                    alert('Elimin??');
                                } else {
                                    alert('No Elimin??');
                                }

                            } else {
                                alert(resp.data.errorMsg);
                            }
                        });
                    };
                };
            </script>    

        <script>
            const navBar = document.querySelector("nav"),
                    menuBtns = document.querySelectorAll(".menu-icon"),
                    overlay = document.querySelector(".overlay");

            menuBtns.forEach((menuBtn) => {
                menuBtn.addEventListener("click", () => {
                    navBar.classList.toggle("open");
                });
            });

            overlay.addEventListener("click", () => {
                navBar.classList.remove("open");
            });
        </script>
    </body>
</html>

