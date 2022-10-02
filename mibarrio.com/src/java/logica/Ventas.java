/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package logica;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import persistencia.ConexionBD;

/**
 *
 * @author USUARIO
 */
public class Ventas {
    private int idVentas;
    private int idProducto;
    private int idUsuario;
    private int precioFinal;
    private String fechaVenta;

    public Ventas() {
    }

    public Ventas(int idVentas, int idProducto, int idUsuario, int precioFinal, String fechaVenta) {
        this.idVentas = idVentas;
        this.idProducto = idProducto;
        this.idUsuario = idUsuario;
        this.precioFinal = precioFinal;
        this.fechaVenta = fechaVenta;
    }

    public int getIdVentas() {
        return idVentas;
    }

    public void setIdVentas(int idVentas) {
        this.idVentas = idVentas;
    }

    public int getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(int idProducto) {
        this.idProducto = idProducto;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public int getPrecioFinal() {
        return precioFinal;
    }

    public void setPrecioFinal(int precioFinal) {
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
        return "Ventas{" + "idVentas=" + idVentas + ", idProducto=" + idProducto + ", idUsuario=" + idUsuario + ", precioFinal=" + precioFinal + ", fechaVenta=" + fechaVenta + '}';
    }
    
      public List<Ventas> consultarVentas(){
     List<Ventas> ventas =new ArrayList<>();
     ConexionBD conexion = new ConexionBD();
     String sql="SELECT * FROM `mibarrio.com`.ventas;";
     ResultSet rs = conexion.consultarBD(sql);
     try{
         Ventas v;
         while(rs.next()){
             v=new Ventas();
             v.setIdVentas(rs.getInt("idVentas"));
             v.setIdProducto(rs.getInt("idProducto"));
             v.setIdUsuario(rs.getInt("idUsuario"));
             v.setPrecioFinal(rs.getInt("precioFinal"));
             v.setFechaVenta(rs.getString("fechaVenta"));
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
        boolean exito=false;
        ConexionBD conexion =new ConexionBD();
        String sql="INSERT INTO ventas (idVentas, idProducto, idUsuario, precioFinal, fechaVenta) VALUES("+idVentas+", "+idProducto+", "+idUsuario+", "+precioFinal+", '"+fechaVenta+"');";
        if(conexion.setAutoCommitBD(false)){
            if(conexion.insertarBD(sql)){
            exito=true;
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
        boolean exito=false;
        ConexionBD conexion =new ConexionBD();
        String sql="UPDATE ventas SET idProducto="+idProducto+", idUsuario="+idUsuario+", precioFinal="+precioFinal+", fechaVenta='"+fechaVenta+"' WHERE idVentas="+idVentas+";";
        if(conexion.setAutoCommitBD(false)){
            if(conexion.actualizarBD(sql)){
            exito=true;
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
        boolean exito=false;
        ConexionBD conexion =new ConexionBD();
        String sql="DELETE FROM ventas WHERE idVentas="+idVentas+";";
        if(conexion.setAutoCommitBD(false)){
            if(conexion.actualizarBD(sql)){
            exito=true;
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
