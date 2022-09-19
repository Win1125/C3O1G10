<%-- 
    Document   : peticionesAutor
    Created on : 12/09/2022, 06:35:56 AM
    Author     : Edwin
--%>

<%@page import="logica.Venta"%>
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
            int idVentas = Integer.parseInt(request.getParameter("idVentas"));
            int fk_idProducto = Integer.parseInt(request.getParameter("fk_idProducto"));
            int fk_idUsuario = Integer.parseInt(request.getParameter("fk_idUsuario"));	
            float precioFinal = Float.parseFloat(request.getParameter("precioFinal"));
            String fechaVenta = request.getParameter("fechaVenta");
            
            Venta v = new Venta(idVentas,fk_idProducto,fk_idUsuario,precioFinal,fechaVenta);
            
            if (v.guardarVenta()) { 
                respuesta += "\"" + proceso + "\": true";
            } else {
                respuesta += "\"" + proceso + "\": false";
            }

        } else if (proceso.equals("eliminar")) {
            //Solicitud de parámetros enviados desde el frontned
            //, uso de request.getParameter("nombre parametro")
            //creación de objeto y llamado a método eliminar
           
            int idVentas = Integer.parseInt(request.getParameter("idVentas"));
            Venta v = new Venta();
            v.setIdVentas(idVentas);
            
            if (v.eliminarVenta()) {
                respuesta += "\"" + proceso + "\": true";
            } else {
                respuesta += "\"" + proceso + "\": false";
            }

        } else if (proceso.equals("listar")) {
        //Solicitud de parámetros enviados desde el frontned
            //, uso de request.getParameter("nombre parametro")
           //creación de objeto y llamado al metodo listar
            try {
                Venta v = new Venta();
                List<Venta> lista = v.consultarVenta();
                respuesta += "\"" + proceso + "\": true,\"ventas\":" + new Gson().toJson(lista);
            } catch (Exception ex) {
                respuesta += "\"" + proceso + "\": true,\"ventas\":[]";
                Logger.getLogger(Venta.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (proceso.equals("actualizar")) {
            //creación de objeto y llamado al metodo actualizar
            int idVentas = Integer.parseInt(request.getParameter("idVentas"));
            int fk_idProducto = Integer.parseInt(request.getParameter("fk_idProducto"));
            int fk_idUsuario = Integer.parseInt(request.getParameter("fk_idUsuario"));	
            float precioFinal = Float.parseFloat(request.getParameter("precioFinal"));
            String fechaVenta = request.getParameter("fechaVenta");
            
            Venta v = new Venta(idVentas,fk_idProducto,fk_idUsuario,precioFinal,fechaVenta);
            
            if (v.actualizarVenta()) {                     
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

