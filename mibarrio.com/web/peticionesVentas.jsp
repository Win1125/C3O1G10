<%-- 
    Document   : Archivo de peticiones
    Created on : dd/mm/yyyy, hh:mm: AM/PM
    Author     : nombre autor
--%>

<%@page import="logica.Ventas"%>
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

    // Validaci�n de par�metros utilizados en todos los procesos.
    if (tareas.contains(proceso)) {
        respuesta += "\"ok\": true,";
        // ------------------------------------------------------------------------------------- //
        // -----------------------------------INICIO PROCESOS----------------------------------- //
        // ------------------------------------------------------------------------------------- //
        if (proceso.equals("guardar")) {

            //Solicitud de par�metros enviados desde el frontned
            //, uso de request.getParameter("nombre parametro")
            // creaci�n de objeto y llamado a m�todo guardar 
            int idVentas =Integer.parseInt(request.getParameter("idVentas"));
            int idProducto =Integer.parseInt(request.getParameter("idProducto"));
            int idUsuario = Integer.parseInt(request.getParameter("idUsuario"));
            int precioFinal = Integer.parseInt(request.getParameter("precioFinal"));
            String fechaVenta = request.getParameter("fechaVenta");
             
            Ventas ve = new Ventas(idVentas,idProducto,idUsuario,precioFinal,fechaVenta);
                

            if (ve.guardarVenta()) { 
                respuesta += "\"" + proceso + "\": true";
            } else {
               respuesta += "\"" + proceso + "\": false";
            }

        } else if (proceso.equals("eliminar")) {
        //Solicitud de par�metros enviados desde el frontned
            //, uso de request.getParameter("nombre parametro")
            //creaci�n de objeto y llamado a m�todo eliminar
            int idVentas =Integer.parseInt(request.getParameter("idVentas"));
            Ventas v= new Ventas();
            v.setIdVentas(idVentas);
            if (v.eliminarVenta()) {
                respuesta += "\"" + proceso + "\": true";
            } else {
                respuesta += "\"" + proceso + "\": false";
            }

        } else if (proceso.equals("listar")) {
        //Solicitud de par�metros enviados desde el frontned
            //, uso de request.getParameter("nombre parametro")
           //creaci�n de objeto y llamado al metodo listar
            try {
            Ventas v= new Ventas();
                List<Ventas> lista = v.consultarVentas();
                respuesta += "\"" + proceso + "\": true,\"ventas\":" + new Gson().toJson(lista);
            } catch (Exception ex) {
                respuesta += "\"" + proceso + "\": true,\"ventas\":[]";
                Logger.getLogger(Ventas.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (proceso.equals("actualizar")) {
            //creaci�n de objeto y llamado al metodo actualizar
             int idVentas =Integer.parseInt(request.getParameter("idVentas"));
            int idProducto =Integer.parseInt(request.getParameter("idProducto"));
            int idUsuario = Integer.parseInt(request.getParameter("idUsuario"));
            int precioFinal = Integer.parseInt(request.getParameter("precioFinal"));
            String fechaVenta = request.getParameter("fechaVenta");
             
            Ventas ve = new Ventas(idVentas,idProducto,idUsuario,precioFinal,fechaVenta);
            if (ve.actualizarVenta()) {                     
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
                + " son inv�lidos. Corrijalos y vuelva a intentar por favor.\"";
    }    
    // Responder como objeto JSON codificaci�n ISO 8859-1.
    respuesta += "}";
    response.setContentType("application/json;charset=iso-8859-1");
    out.print(respuesta);
%>


