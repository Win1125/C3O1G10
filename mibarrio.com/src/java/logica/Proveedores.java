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
public class Proveedores {
    private int idProveedor;
    private String nombreProveedor;
    private String contacto;
    private String correo;
    private int nit;

    public Proveedores() {
    }

    public Proveedores(int idProveedor, String nombreProveedor, String contacto, String correo, int nit) {
        this.idProveedor = idProveedor;
        this.nombreProveedor = nombreProveedor;
        this.contacto = contacto;
        this.correo = correo;
        this.nit = nit;
    }

    public int getIdProveedor() {
        return idProveedor;
    }

    public void setIdProveedor(int idProveedor) {
        this.idProveedor = idProveedor;
    }

    public String getNombreProveedor() {
        return nombreProveedor;
    }

    public void setNombreProveedor(String nombreProveedor) {
        this.nombreProveedor = nombreProveedor;
    }

    public String getContacto() {
        return contacto;
    }

    public void setContacto(String contacto) {
        this.contacto = contacto;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public int getNit() {
        return nit;
    }

    public void setNit(int nit) {
        this.nit = nit;
    }

    @Override
    public String toString() {
        return "Proveedores{" + "idProveedor=" + idProveedor + ", nombreProveedor=" + nombreProveedor + ", contacto=" + contacto + ", correo=" + correo + ", nit=" + nit + '}';
    }
    
     public List<Proveedores> consultarProveedores(){
     List<Proveedores> provee =new ArrayList<>();
     ConexionBD conexion = new ConexionBD();
     String sql="SELECT * FROM mibarrio.com proveedores;";
     ResultSet rs = conexion.consultarBD(sql);
     try{
         Proveedores pv;
         while(rs.next()){
             pv=new Proveedores();
             pv.setIdProveedor(rs.getInt("idProveedor"));
             pv.setNombreProveedor(rs.getString("nobreProveedor"));
             pv.setContacto(rs.getString("contacto"));
             pv.setCorreo(rs.getString("correo"));
             pv.setNit(rs.getInt("nit"));
            
             provee.add(pv);
         }
     }catch(SQLException ex){
         System.out.println(ex.getMessage());
     }finally{
         conexion.cerrarConexion();
     }
    
     return provee;
    }
    public boolean guardarProveedor(){
        boolean exito=false;
        ConexionBD conexion =new ConexionBD();
        String sql="INSERT INTO `mibarrio.com`.proveedores (idProveedor, nombreProveedor, contacto, correo, nit) VALUES("+idProveedor+", '"+nombreProveedor+"', '"+contacto+"', '"+correo+"', "+nit+");";
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
    
    public boolean actualizarProveedor(){
        boolean exito=false;
        ConexionBD conexion =new ConexionBD();
        String sql="UPDATE `mibarrio.com`.proveedores SET nombreProveedor='"+nombreProveedor+"', contacto='"+contacto+"', correo='"+correo+"', nit="+nit+" WHERE idProveedor="+idProveedor+";";
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
     public boolean eliminarProveedor(){
        boolean exito=false;
        ConexionBD conexion =new ConexionBD();
        String sql="DELETE FROM `mibarrio.com`.proveedores WHERE idProveedor="+idProveedor+";";
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
