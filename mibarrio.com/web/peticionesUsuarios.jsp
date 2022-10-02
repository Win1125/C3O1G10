<%-- 
    Document   : Archivo de peticiones
    Created on : dd/mm/yyyy, hh:mm: AM/PM
    Author     : nombre autor
--%>

<%@page import="logica.Usuarios"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="application/json;charset=iso-8859-1" language="java" pageEncoding="iso-8859-1" session="true"%>

<%    // Iniciando respuesta JSON.
    String respuesta = "{";

    //Lista de procesos o tareas a realizar 
    List<String> tareas = Arrays.asList(new String[]{
        "guardar",
        "eliminar",
        "actualizar",
        "listar"
	
    });

    String proceso = "" + request.getParameter("proceso");

    // Validación de parámetros utilizados en todos los procesos.
    if (tareas.contains(proceso)) {
        respuesta += "\"ok\": true,";
        // ------------------------------------------------------------------------------------- //
        // -----------------------------------INICIO PROCESOS----------------------------------- //
        // ------------------------------------------------------------------------------------- //
        if (proceso.equals("guardar")) {

            //Solicitud de parámetros enviados desde el frontned
            //, uso de request.getParameter("nombre parametro")
            // creación de objeto y llamado a método guardar  
            int  idUsuario =Integer.parseInt(request.getParameter("idUsuario"));
            String tipoDocuento= request.getParameter("tipoDocumento");
            int numeroDeDocumento = Integer.parseInt(request.getParameter("numeroDeDocumento"));
            String nombres = request.getParameter("nombres");
            String apellidos = request.getParameter("apellidos");
            String celular =request.getParameter("celular");
            String tipoUsuario =request.getParameter("tipoUsuario");
            String correo = request.getParameter("correo");
            String contrasena = request.getParameter("contraseña");

            Usuarios u = new Usuarios(idUsuario,tipoDocuento,numeroDeDocumento,nombres,apellidos,celular,tipoUsuario,correo,contrasena);
            if (u.guardarUsuarios()) { 
                respuesta += "\"" + proceso + "\": true";
            } else {
                respuesta += "\"" + proceso + "\": false";
            }

        } else if (proceso.equals("eliminar")) {
        //Solicitud de parámetros enviados desde el frontned
            //, uso de request.getParameter("nombre parametro")
            //creación de objeto y llamado a método eliminar
            if (true) {
                respuesta += "\"" + proceso + "\": true";
            } else {
                respuesta += "\"" + proceso + "\": false";
            }

        } else if (proceso.equals("listar")) {
        //Solicitud de parámetros enviados desde el frontned
            //, uso de request.getParameter("nombre parametro")
           //creación de objeto y llamado al metodo listar
            try {
            Usuarios u = new Usuarios();
                List<Usuarios> lista = u.consultarUsuarios();
                respuesta += "\"" + proceso + "\": true,\"NombreLista\":" + new Gson().toJson(lista);
            } catch (Exception ex) {
                respuesta += "\"" + proceso + "\": true,\"NombreLista\":[]";
                Logger.getLogger(Usuarios.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (proceso.equals("actualizar")) {
            //creación de objeto y llamado al metodo actualizar
            int  idUsuario =Integer.parseInt(request.getParameter("idUsuario"));
            String tipoDocuento= request.getParameter("tipoDocumento");
            int numeroDeDocumento = Integer.parseInt(request.getParameter("numeroDeDocumento"));
            String nombres = request.getParameter("nombres");
            String apellidos = request.getParameter("apellidos");
            String celular =request.getParameter("celular");
            String tipoUsuario =request.getParameter("tipoUsuario");
            String correo = request.getParameter("correo");
            String contrasena = request.getParameter("contraseña");

            Usuarios u = new Usuarios(idUsuario,tipoDocuento,numeroDeDocumento,nombres,apellidos,celular,tipoUsuario,correo,contrasena);
            if (u.actualizarUsuarios()) {                     
                respuesta += "\"" + proceso + "\": true";
            } else {
                respuesta += "\"" + proceso + "\": false";
            }
        }

        // ------------------------------------------------------------------------------------- //
        // -----------------------------------FIN PROCESOS-------------------------------------- //
        // ------------------------------------------------------------------------------------- //
        // Proceso desconocido.
    } else {
        respuesta += "\"ok\": false,";
        respuesta += "\"error\": \"INVALID\",";
        respuesta += "\"errorMsg\": \"Lo sentimos, los datos que ha enviado,"
                + " son inválidos. Corrijalos y vuelva a intentar por favor.\"";
    }    
    // Responder como objeto JSON codificación ISO 8859-1.
    respuesta += "}";
    response.setContentType("application/json;charset=iso-8859-1");
    out.print(respuesta);
%>


