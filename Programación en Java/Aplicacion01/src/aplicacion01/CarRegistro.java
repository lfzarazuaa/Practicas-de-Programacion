/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package aplicacion01;

/**
 *
 * @author Sala1
 */
public class CarRegistro extends Carro{
  protected boolean Acceso;
  CarRegistro(){
   super();
   Acceso=false;
  }

    public boolean isAcceso() {
        return Acceso;
    }

    public void setAcceso(boolean Acceso) {
        this.Acceso = Acceso;
    }
  
  CarRegistro(String M1, String M2, int O){
   super(M1,M2,O);
   Acceso=true;
  }  
}