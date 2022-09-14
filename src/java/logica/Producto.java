/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package logica;

import java.sql.*;
import java.util.*;
import persistencia.ConexionBD;

/**
 *
 * @author Edwin
 */
public class Producto {

    private int idProducto;
    private String nombreProducto;	
    private String fechaCompra;
    private String fechaVencimiento;	
    private String lote;
    private float precioBase;	
    private float precioVenta; 
    private int fk_idProveedor;	

    public Producto() {
    }

    public Producto(int idProducto, String nombreProducto, String fechaCompra, String fechaVencimiento, String lote, float precioBase, float precioVenta, int fk_idProveedor) {
        this.idProducto = idProducto;
        this.nombreProducto = nombreProducto;
        this.fechaCompra = fechaCompra;
        this.fechaVencimiento = fechaVencimiento;
        this.lote = lote;
        this.precioBase = precioBase;
        this.precioVenta = precioVenta;
        this.fk_idProveedor = fk_idProveedor;
    }

    public int getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(int idProducto) {
        this.idProducto = idProducto;
    }

    public String getNombreProducto() {
        return nombreProducto;
    }

    public void setNombreProducto(String nombreProducto) {
        this.nombreProducto = nombreProducto;
    }

    public String getFechaCompra() {
        return fechaCompra;
    }

    public void setFechaCompra(String fechaCompra) {
        this.fechaCompra = fechaCompra;
    }

    public String getFechaVencimiento() {
        return fechaVencimiento;
    }

    public void setFechaVencimiento(String fechaVencimiento) {
        this.fechaVencimiento = fechaVencimiento;
    }

    public String getLote() {
        return lote;
    }

    public void setLote(String lote) {
        this.lote = lote;
    }

    public float getPrecioBase() {
        return precioBase;
    }

    public void setPrecioBase(float precioBase) {
        this.precioBase = precioBase;
    }

    public float getPrecioVenta() {
        return precioVenta;
    }

    public void setPrecioVenta(float precioVenta) {
        this.precioVenta = precioVenta;
    }

    public int getFk_idProveedor() {
        return fk_idProveedor;
    }

    public void setFk_idProveedor(int fk_idProveedor) {
        this.fk_idProveedor = fk_idProveedor;
    }

    @Override
    public String toString() {
        return "Producto{" + "idProducto=" + idProducto + ", nombreProducto=" + nombreProducto + ", fechaCompra=" + fechaCompra + ", fechaVencimiento=" + fechaVencimiento + ", lote=" + lote + ", precioBase=" + precioBase + ", precioVenta=" + precioVenta + ", fk_idProveedor=" + fk_idProveedor + '}';
    }
    
    public List<Producto> consultarProducto(){
        List<Producto> productos = new ArrayList<>();
        ConexionBD conexion = new ConexionBD();
        
        String sql = "SELECT * FROM productos";
        ResultSet rs = conexion.consultarBD(sql);
        
        try{
            
            Producto p;
            
            while(rs.next()){
                p = new Producto();
                p.setIdProducto(rs.getInt("idProducto"));
                p.setNombreProducto(rs.getString("nombreProducto"));
                p.setPrecioBase(rs.getFloat("precioBase"));
                p.setPrecioVenta(rs.getFloat("precioVenta"));
                p.setLote(rs.getString("lote"));
                p.setFechaCompra(rs.getString("fechaCompra"));
                p.setFechaVencimiento(rs.getString("fechaVencimiento"));
                p.setFk_idProveedor(rs.getInt("fk_idProveedor"));
                productos.add(p);
            }
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }finally{
            conexion.cerrarConexion();
        }
        
        
        return productos;
    }
    
    public boolean guardarProducto(){
        
        boolean exito = false;
        
        ConexionBD conexion = new ConexionBD();
        String sql="INSERT INTO productos(idProducto,nombreProducto,fechaCompra,fechaVencimiento,lote,precioBase,precioVenta,fk_idProveedor) VALUES ('"+idProducto+"', '"+nombreProducto+"', '"+fechaCompra+"', '"+fechaVencimiento+"', '"+lote+"', '"+precioBase+"', '"+precioVenta+"', '"+fk_idProveedor+"')";
        
        if(conexion.setAutoCommitBD(false)){
            if(conexion.insertarBD(sql)){
                exito = true;
                conexion.commitBD();
                conexion.cerrarConexion();
            }else{
                conexion.rollbackBD();
                conexion.cerrarConexion();
            }
        }else{
            conexion.cerrarConexion();
        }
        
        return exito;
    }
    
    public boolean actualizarProducto(){
        
        boolean exito = false;
        
        ConexionBD conexion = new ConexionBD();
        String sql="UPDATE productos SET idProducto='"+idProducto+"', nombreProducto='"+nombreProducto+"', fechaCompra='"+fechaCompra+"', fechaVencimiento='"+fechaVencimiento+"', lote='"+lote+"', precioBase='"+precioBase+"', precioVenta='"+precioVenta+"', fk_idProveedor='"+fk_idProveedor+"' WHERE idProducto='"+idProducto+"'";

        if(conexion.setAutoCommitBD(false)){
            if(conexion.insertarBD(sql)){
                exito = true;
                conexion.commitBD();
                conexion.cerrarConexion();
            }else{
                conexion.rollbackBD();
                conexion.cerrarConexion();
            }
        }else{
            conexion.cerrarConexion();
        }
        
        return exito;
    }
    
    public boolean eliminarProducto(){
        
        boolean exito = false;
        
        ConexionBD conexion = new ConexionBD();
        String sql="DELETE FROM productos WHERE idProducto='"+idProducto+"'";
        
        if(conexion.setAutoCommitBD(false)){
            if(conexion.insertarBD(sql)){
                exito = true;
                conexion.commitBD();
                conexion.cerrarConexion();
            }else{
                conexion.rollbackBD();
                conexion.cerrarConexion();
            }
        }else{
            conexion.cerrarConexion();
        }
        
        return exito;
    }
    
}
