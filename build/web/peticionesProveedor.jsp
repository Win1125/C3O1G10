<%-- 
    Document   : peticionesAutor
    Created on : 12/09/2022, 06:35:56 AM
    Author     : Edwin
--%>

<%@page import="logica.Proveedor"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="application/json;charset=iso-8859-1" language="java" pageEncoding="iso-8859-1" session="true"%>

<%  // Iniciando respuesta JSON.
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

            	
            int idProveedor = Integer.parseInt(request.getParameter("idProveedor"));	
            String nombreProveedor = request.getParameter("nombreProveedor");
            String contacto = request.getParameter("contacto");	
            String correo = request.getParameter("correo");	
            String nit = request.getParameter("nit");
            
            Proveedor pr = new Proveedor(idProveedor, nombreProveedor, contacto, correo, nit);
            
            if (pr.guardarProveedor()) { 
                respuesta += "\"" + proceso + "\": true";
            } else {
                respuesta += "\"" + proceso + "\": false";
            }

        } else if (proceso.equals("eliminar")) {
            //Solicitud de parámetros enviados desde el frontned
            //, uso de request.getParameter("nombre parametro")
            //creación de objeto y llamado a método eliminar
           
            int idProveedor = Integer.parseInt(request.getParameter("idProveedor"));
            Proveedor pr = new Proveedor();
            pr.setIdProveedor(idProveedor);
            
            if (pr.eliminarProveedor()) {
                respuesta += "\"" + proceso + "\": true";
            } else {
                respuesta += "\"" + proceso + "\": false";
            }

        } else if (proceso.equals("listar")) {
        //Solicitud de parámetros enviados desde el frontned
            //, uso de request.getParameter("nombre parametro")
           //creación de objeto y llamado al metodo listar
            try {
                Proveedor pr = new Proveedor();
                List<Proveedor> lista = pr.consultarProveedor();
                respuesta += "\"" + proceso + "\": true,\"Proveedor\":" + new Gson().toJson(lista);
            } catch (Exception ex) {
                respuesta += "\"" + proceso + "\": true,\"Proveedor\":[]";
                Logger.getLogger(Proveedor.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (proceso.equals("actualizar")) {
            //creación de objeto y llamado al metodo actualizar
            int idProveedor = Integer.parseInt(request.getParameter("idProveedor"));	
            String nombreProveedor = request.getParameter("nombreProveedor");
            String contacto = request.getParameter("contacto");	
            String correo = request.getParameter("correo");	
            String nit = request.getParameter("nit");
            
            Proveedor pr = new Proveedor(idProveedor, nombreProveedor, contacto, correo, nit);
            
            if (pr.actualizarProveedor()) {                     
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

