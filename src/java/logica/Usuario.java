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
public class Usuario {
    
    private int idUsuario;	
    private String nombres;
    private String apellidos;
    private String tipoDocumento;	
    private String numeroDocumento;	
    private String celular;
    private int privilegioUsuario;	
    private String correo;
    private String password;

    public Usuario() {
    }

    public Usuario(int idUsuario, String nombres, String apellidos, String tipoDocumento, String numeroDocumento, String celular, int privilegioUsuario, String correo, String password) {
        this.idUsuario = idUsuario;
        this.nombres = nombres;
        this.apellidos = apellidos;
        this.tipoDocumento = tipoDocumento;
        this.numeroDocumento = numeroDocumento;
        this.celular = celular;
        this.privilegioUsuario = privilegioUsuario;
        this.correo = correo;
        this.password = password;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getTipoDocumento() {
        return tipoDocumento;
    }

    public void setTipoDocumento(String tipoDocumento) {
        this.tipoDocumento = tipoDocumento;
    }

    public String getNumeroDocumento() {
        return numeroDocumento;
    }

    public void setNumeroDocumento(String numeroDocumento) {
        this.numeroDocumento = numeroDocumento;
    }

    public String getCelular() {
        return celular;
    }

    public void setCelular(String celular) {
        this.celular = celular;
    }

    public int getPrivilegioUsuario() {
        return privilegioUsuario;
    }

    public void setPrivilegioUsuario(int privilegioUsuario) {
        this.privilegioUsuario = privilegioUsuario;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "Usuario{" + "idUsuario=" + idUsuario + ", nombres=" + nombres + ", apellidos=" + apellidos + ", tipoDocumento=" + tipoDocumento + ", numeroDocumento=" + numeroDocumento + ", celular=" + celular + ", privilegioUsuario=" + privilegioUsuario + ", correo=" + correo + ", password=" + password + '}';
    }


    public List<Usuario> consultarUsuario(){
        List<Usuario> usuarios = new ArrayList<>();
        ConexionBD conexion = new ConexionBD();
        
        String sql = "SELECT * FROM usuarios";
        ResultSet rs = conexion.consultarBD(sql);
        
        try{
            
            Usuario u;
            
            while(rs.next()){
                u = new Usuario();
                u.setApellidos(rs.getString("apellidos"));
                u.setCelular(rs.getString("celular"));
                u.setCorreo(rs.getString("correo"));
                u.setIdUsuario(rs.getInt("idUsuario"));
                u.setNombres(rs.getString("nombres"));
                u.setNumeroDocumento(rs.getString("numeroDocumento"));
                u.setPassword(rs.getString("password"));
                u.setPrivilegioUsuario(rs.getInt("privilegioUsuario"));
                u.setTipoDocumento(rs.getString("tipoDocumento"));
                usuarios.add(u);
            }
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }finally{
            conexion.cerrarConexion();
        }
        
        
        return usuarios;
    }
    
    public boolean guardarUsuario(){
        
        boolean exito = false;
        
        ConexionBD conexion = new ConexionBD();
        String sql="INSERT INTO usuarios(idUsuario, nombres, apellidos, tipoDocumento, numeroDocumento, celular, privilegioUsuario, correo, password) VALUES ('"+idUsuario+"', '"+nombres+"', '"+apellidos+"', '"+tipoDocumento+"', '"+numeroDocumento+"', '"+celular+"', '"+privilegioUsuario+"', '"+correo+"', '"+password+"')";
        
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
    
    public boolean actualizarUsuario(){
        
        boolean exito = false;
        
        ConexionBD conexion = new ConexionBD();
        String sql="UPDATE usuarios SET idUsuario='"+idUsuario+"',nombres='"+nombres+"',apellidos='"+apellidos+"',tipoDocumento='"+tipoDocumento+"',numeroDocumento='"+numeroDocumento+"',celular='"+celular+"',privilegioUsuario='"+privilegioUsuario+"',correo='"+correo+"',password='"+password+"' WHERE idUsuario = '"+idUsuario+"'";

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
    
    public boolean eliminarUsuario(){
        
        boolean exito = false;
        
        ConexionBD conexion = new ConexionBD();
        String sql="DELETE FROM usuarios WHERE idUsuario = '"+idUsuario+"'";
        
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
