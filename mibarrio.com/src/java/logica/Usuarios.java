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
public class Usuarios {
  private int idUsuario;
  private String tipoDocumento;
  private int numeroDeDocumento;
  private String nombres;
  private String apellidos;
  private String celular;
  private String tipoUsuario;
  private String correo;
  private String contrasena;

    public Usuarios() {
    }

    public Usuarios(int idUsuario, String tipoDocumento, int numeroDeDocumento, String nombres, String apellidos, String celular, String tipoUsuario, String correo, String contrasena) {
        this.idUsuario = idUsuario;
        this.tipoDocumento = tipoDocumento;
        this.numeroDeDocumento = numeroDeDocumento;
        this.nombres = nombres;
        this.apellidos = apellidos;
        this.celular = celular;
        this.tipoUsuario = tipoUsuario;
        this.correo = correo;
        this.contrasena = contrasena;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getTipoDocumento() {
        return tipoDocumento;
    }

    public void setTipoDocumento(String tipoDocumento) {
        this.tipoDocumento = tipoDocumento;
    }

    public int getNumeroDeDocumento() {
        return numeroDeDocumento;
    }

    public void setNumeroDeDocumento(int numeroDeDocumento) {
        this.numeroDeDocumento = numeroDeDocumento;
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

    public String getCelular() {
        return celular;
    }

    public void setCelular(String celular) {
        this.celular = celular;
    }

    public String getTipoUsuario() {
        return tipoUsuario;
    }

    public void setTipoUsuario(String tipoUsuario) {
        this.tipoUsuario = tipoUsuario;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    @Override
    public String toString() {
        return ", numeroDeDocumento=" + "Usuarios{" + "idUsuario=" + idUsuario + ", tipoDocumento=" + tipoDocumento + numeroDeDocumento + ", nombres=" + nombres + ", apellidos=" + apellidos + ", celular=" + celular + ", tipoUsuario=" + tipoUsuario + ", correo=" + correo + ", contrasena=" + contrasena + '}';
    }
   public List<Usuarios> consultarUsuarios(){
     List<Usuarios> usua =new ArrayList<>();
     ConexionBD conexion = new ConexionBD();
     String sql="SELECT * FROM mibarrio.com.usuarios;";
     ResultSet rs = conexion.consultarBD(sql);
     try{
         Usuarios u;
         while(rs.next()){
             u=new Usuarios();
             u.setIdUsuario(rs.getInt("idUsuario"));
             u.setTipoDocumento(rs.getString("tipoDocumento"));
             u.setNumeroDeDocumento(rs.getInt("numeroDeDocumento"));
             u.setNombres(rs.getString("nombres"));
             u.setApellidos(rs.getString("apellidos"));
             u.setCelular(rs.getString("celular"));
             u.setTipoUsuario(rs.getString("tipoUsurio"));
             u.setCorreo(rs.getString("correo"));
             u.setContrasena(rs.getString("contrasena"));
             usua.add(u);
         }
     }catch(SQLException ex){
         System.out.println(ex.getMessage());
     }finally{
         conexion.cerrarConexion();
     }
    
     return usua;
    }
    public boolean guardarUsuarios(){
        boolean exito=false;
        ConexionBD conexion =new ConexionBD();
        String sql="INSERT INTO `mibarrio.com`.usuarios (idUsuario, tipoDocumento, numeroDeDocumento, nombres, apellidos, celular, tipoUsuario, correo, contrasena) VALUES("+idUsuario+", '"+tipoDocumento+"', "+numeroDeDocumento+", '"+nombres+"', '"+apellidos+"', '"+celular+"', '"+tipoUsuario+"', '"+correo+"', '"+contrasena+"');";
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
    
    public boolean actualizarUsuarios(){
        boolean exito=false;
        ConexionBD conexion =new ConexionBD();
        String sql="UPDATE `mibarrio.com`.usuarios SET tipoDocumento='"+tipoDocumento+"', numeroDeDocumento="+numeroDeDocumento+", nombres='"+nombres+"', apellidos='"+apellidos+"', celular='"+celular+"', tipoUsuario='"+tipoUsuario+"', correo='"+correo+"', contrasena='"+contrasena+"' WHERE idUsuario="+idUsuario+";";
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
     public boolean eliminarUsuarios(){
        boolean exito=false;
        ConexionBD conexion =new ConexionBD();
        String sql="DELETE FROM `mibarrio.com`.usuarios WHERE idUsuario="+idUsuario+";";
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
