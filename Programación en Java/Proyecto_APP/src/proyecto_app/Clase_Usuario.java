/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proyecto_app;

/**
 *
 * @author LuisFernando
 */
public class Clase_Usuario {
  private String Usuario;
  private int usuario;

    public Clase_Usuario() {
    
    }

    public Clase_Usuario(String Usuario, int usuario) {
        this.Usuario = Usuario;
        this.usuario = usuario;
    }

    public String getUsuario_S() {
        return Usuario;
    }

    public void setUsuario_S(String Usuario) {
        this.Usuario = Usuario;
    }

    public int getUsuario() {
        return usuario;
    }

    public void setUsuario(int usuario) {
        this.usuario = usuario;
    }
    
}
