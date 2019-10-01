/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proyecto_app;
import  java.util.ArrayList;
/**
 *
 * @author LuisFernando
 */
public class Clase_Identificadores_de_Usuarios {
  ArrayList <Clase_Identificador_de_Usuario> Usuarios;
  int Numero_de_Usuarios;
     public Clase_Identificadores_de_Usuarios() {
       Usuarios=new ArrayList(15);//Crea un arreglo con 15 espacios.
       Numero_de_Usuarios=0;
     }
     public void Agregar_Usuario(Clase_Identificador_de_Usuario Identificador_de_Usuario){
      Usuarios.add(Identificador_de_Usuario);
      Numero_de_Usuarios=Usuarios.size();
     }
     public void addItem(Clase_Identificador_de_Usuario Identificador_de_Usuario){
      Usuarios.add(Identificador_de_Usuario);
      Numero_de_Usuarios=Usuarios.size();
     }
     public void removeAllItems(){
      Usuarios.clear();
      Numero_de_Usuarios=Usuarios.size();
     }
     public int getSize()
     {
      return Usuarios.size();
     }
     public Clase_Identificador_de_Usuario getItem(int indice)
     {
        if (indice<getSize())
        {
          return Usuarios.get(indice);
        }
        return null;
     }
}
