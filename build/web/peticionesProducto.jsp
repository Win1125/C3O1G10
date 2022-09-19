<%-- 
    Document   : peticionesAutor
    Created on : 12/09/2022, 06:35:56 AM
    Author     : Edwin
--%>

<%@page import="logica.Producto"%>
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
            
            int idProducto = Integer.parseInt(request.getParameter("idProducto"));
            String nombreProducto = request.getParameter("nombreProducto");	
            String fechaCompra = request.getParameter("fechaCompra");
            String fechaVencimiento = request.getParameter("fechaVencimiento");	
            String lote = request.getParameter("lote");
            float precioBase = Float.parseFloat(request.getParameter("precioBase"));	
            float precioVenta = Float.parseFloat(request.getParameter("precioVenta"));
            int fk_idProveedor = Integer.parseInt(request.getParameter("fk_idProveedor"));	
            
            Producto pd = new Producto(idProducto,nombreProducto,fechaCompra,fechaVencimiento,lote,precioBase,precioVenta,fk_idProveedor);	
            
            if (pd.guardarProducto()) { 
                respuesta += "\"" + proceso + "\": true";
            } else {
                respuesta += "\"" + proceso + "\": false";
            }

        } else if (proceso.equals("eliminar")) {
            //Solicitud de parámetros enviados desde el frontned
            //, uso de request.getParameter("nombre parametro")
            //creación de objeto y llamado a método eliminar
           
            int idProducto = Integer.parseInt(request.getParameter("idProducto"));
            Producto pd = new Producto();
            pd.setIdProducto(idProducto);
            
            if (pd.eliminarProducto()) {
                respuesta += "\"" + proceso + "\": true";
            } else {
                respuesta += "\"" + proceso + "\": false";
            }

        } else if (proceso.equals("listar")) {
        //Solicitud de parámetros enviados desde el frontned
            //, uso de request.getParameter("nombre parametro")
           //creación de objeto y llamado al metodo listar
            try {
                Producto pd = new Producto();
                List<Producto> lista = pd.consultarProducto();
                respuesta += "\"" + proceso + "\": true,\"productos\":" + new Gson().toJson(lista);
            } catch (Exception ex) {
                respuesta += "\"" + proceso + "\": true,\"productos\":[]";
                Logger.getLogger(Producto.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (proceso.equals("actualizar")) {
            //creación de objeto y llamado al metodo actualizar
            int idProducto = Integer.parseInt(request.getParameter("idProducto"));
            String nombreProducto = request.getParameter("nombreProducto");	
            String fechaCompra = request.getParameter("fechaCompra");
            String fechaVencimiento = request.getParameter("fechaVencimiento");	
            String lote = request.getParameter("lote");
            float precioBase = Float.parseFloat(request.getParameter("precioBase"));	
            float precioVenta = Float.parseFloat(request.getParameter("precioVenta"));
            int fk_idProveedor = Integer.parseInt(request.getParameter("fk_idProveedor"));
            
            Producto pd = new Producto(idProducto,nombreProducto,fechaCompra,fechaVencimiento,lote,precioBase,precioVenta,fk_idProveedor);
            
            if (pd.actualizarProducto()) {                     
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

