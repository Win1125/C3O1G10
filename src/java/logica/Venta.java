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
public class Venta {
    
    private int idVentas;
    private int fk_idProducto;
    private int fk_idUsuario;	
    private float precioFinal;
    private String fechaVenta;

    public Venta() {
    }

    public Venta(int idVentas, int fk_idProducto, int fk_idUsuario, float precioFinal, String fechaVenta) {
        this.idVentas = idVentas;
        this.fk_idProducto = fk_idProducto;
        this.fk_idUsuario = fk_idUsuario;
        this.precioFinal = precioFinal;
        this.fechaVenta = fechaVenta;
    }

    public int getIdVentas() {
        return idVentas;
    }

    public void setIdVentas(int idVentas) {
        this.idVentas = idVentas;
    }

    public int getFk_idProducto() {
        return fk_idProducto;
    }

    public void setFk_idProducto(int fk_idProducto) {
        this.fk_idProducto = fk_idProducto;
    }

    public int getFk_idUsuario() {
        return fk_idUsuario;
    }

    public void setFk_idUsuario(int fk_idUsuario) {
        this.fk_idUsuario = fk_idUsuario;
    }

    public float getPrecioFinal() {
        return precioFinal;
    }

    public void setPrecioFinal(float precioFinal) {
        this.precioFinal = precioFinal;
    }

    public String getFechaVenta() {
        return fechaVenta;
    }

    public void setFechaVenta(String fechaVenta) {
        this.fechaVenta = fechaVenta;
    }

    @Override
    public String toString() {
        return "Venta{" + "idVentas=" + idVentas + ", fk_idProducto=" + fk_idProducto + ", fk_idUsuario=" + fk_idUsuario + ", precioFinal=" + precioFinal + ", fechaVenta=" + fechaVenta + '}';
    }

    public List<Venta> consultarVenta(){
        List<Venta> ventas = new ArrayList<>();
        ConexionBD conexion = new ConexionBD();
        
        String sql = "SELECT * FROM ventas";
        ResultSet rs = conexion.consultarBD(sql);
        
        try{
            
            Venta v;
            
            while(rs.next()){
                v = new Venta();
                v.setIdVentas(rs.getInt("idVentas"));
                v.setFk_idProducto(rs.getInt("fk_idProducto"));
                v.setFk_idUsuario(rs.getInt("fk_idUsuario"));
                v.setPrecioFinal(rs.getFloat("PrecioFinal"));
                v.setFechaVenta(rs.getString("FechaVenta"));
                ventas.add(v);
            }
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }finally{
            conexion.cerrarConexion();
        }
        
        
        return ventas;
    }
    
    public boolean guardarVenta(){
        
        boolean exito = false;
        
        ConexionBD conexion = new ConexionBD();
        String sql="INSERT INTO ventas(idVentas,fk_idProducto,fk_idUsuario,precioFinal,fechaVenta) VALUES ('"+idVentas+"', '"+fk_idProducto+"', '"+fk_idUsuario+"', '"+precioFinal+"', '"+fechaVenta+"')";
        
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
    
    public boolean actualizarVenta(){
        
        boolean exito = false;
        
        ConexionBD conexion = new ConexionBD();
        String sql="UPDATE ventas SET idVentas='"+idVentas+"', fk_idProducto='"+fk_idProducto+"', fk_idUsuario='"+fk_idUsuario+"', precioFinal='"+precioFinal+"', fechaVenta='"+fechaVenta+"' WHERE idVentas = '"+idVentas+"'";

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
    
    public boolean eliminarVenta(){
        
        boolean exito = false;
        
        ConexionBD conexion = new ConexionBD();
        String sql="DELETE FROM ventas WHERE idVentas = '"+idVentas+"'";
        
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
