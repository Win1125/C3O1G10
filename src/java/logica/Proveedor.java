/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package logica;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import persistencia.ConexionBD;

/**
 *
 * @author Edwin
 */
public class Proveedor {
    
    private int idProveedor;	
    private String nombreProveedor;
    private String contacto;	
    private String correo;	
    private String nit;

    public Proveedor() {
    }

    public Proveedor(int idProveedor, String nombreProveedor, String contacto, String correo, String nit) {
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

    public String getNit() {
        return nit;
    }

    public void setNit(String nit) {
        this.nit = nit;
    }

    @Override
    public String toString() {
        return "Proveedor{" + "idProveedor=" + idProveedor + ", nombreProveedor=" + nombreProveedor + ", contacto=" + contacto + ", correo=" + correo + ", nit=" + nit + '}';
    }
    
    public List<Proveedor> consultarProveedor(){
        List<Proveedor> proveedores = new ArrayList<>();
        ConexionBD conexion = new ConexionBD();
        
        String sql = "SELECT * FROM proveedores";
        ResultSet rs = conexion.consultarBD(sql);
        
        try{
            
            Proveedor p;
            
            while(rs.next()){
                p = new Proveedor();
                p.setContacto(rs.getString("contacto"));
                p.setCorreo(rs.getString("correo"));
                p.setIdProveedor(rs.getInt("idProveedor"));
                p.setNit(rs.getString("nit"));
                p.setNombreProveedor(rs.getString("nombreProveedor"));
                proveedores.add(p);
            }
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }finally{
            conexion.cerrarConexion();
        }
        
        
        return proveedores;
    }
    
    public boolean guardarProveedor(){
        
        boolean exito = false;
        
        ConexionBD conexion = new ConexionBD();
        String sql="INSERT INTO proveedores(idProveedor, nombreProveedor, contacto, correo, nit) VALUES ('"+idProveedor+"', '"+nombreProveedor+"', '"+contacto+"', '"+correo+"', '"+nit+"')";
        
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
    
    public boolean actualizarProveedor(){
        
        boolean exito = false;
        
        ConexionBD conexion = new ConexionBD();
        String sql="UPDATE proveedores SET idProveedor='"+idProveedor+"', nombreProveedor='"+nombreProveedor+"', contacto='"+contacto+"', correo='"+correo+"', nit='"+nit+"' WHERE idProveedor = '"+idProveedor+"'";

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
    
    public boolean eliminarProveedor(){
        
        boolean exito = false;
        
        ConexionBD conexion = new ConexionBD();
        String sql="DELETE FROM proveedores WHERE idProveedor = '"+idProveedor+"'";
        
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
