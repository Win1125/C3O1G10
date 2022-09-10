/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package logica;

import java.util.List;

/**
 *
 * @author Edwin
 */
public class Demo {
    
    public static void main(String[] args){
        
        Usuario u = new Usuario();
        
        u.setApellidos("");
        u.setCelular("");
        u.setCorreo("");
        u.setIdUsuario(1);
        u.setNombres("");
        u.setNumeroDocumento("");
        u.setPassword("");
        u.setPrivilegioUsuario(1);
        u.setTipoDocumento("");

        List<Usuario> usuarios = u.consultarUsuario();
        usuarios.forEach(ax -> {
            System.out.println(ax.toString());
        });
        
    }
    
}
