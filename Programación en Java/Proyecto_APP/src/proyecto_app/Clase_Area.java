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
public class Clase_Area {
  public String Nombre_del_Area;
  public int Numero_del_Area; 
  public int Numero_de_Empleados;
  ArrayList <Clase_Persona> Empleados_del_Area;

    public Clase_Area(String Nombre_del_Area, int Numero_del_Area){
        this.Nombre_del_Area = Nombre_del_Area;
        this.Numero_del_Area = Numero_del_Area;
        this.Numero_de_Empleados = 0;
        this.Empleados_del_Area=new ArrayList(15);//Crea un arreglo con 15 espacios.;
    }
    
    public void Agregar_Empleado(Clase_Persona Persona){
      Empleados_del_Area.add(Persona);
      Numero_de_Empleados=Empleados_del_Area.size();
     }
    public void removeAllItems(){
      Empleados_del_Area.clear();
      Numero_de_Empleados=Empleados_del_Area.size();
    }
    public void Despedir_Empleado(int Numero_de_Empleado){
      Empleados_del_Area.remove(Numero_de_Empleado);
      Numero_de_Empleados=Empleados_del_Area.size();
    }
    public boolean Despedir_Empleado(Clase_Persona Persona){
        boolean S=Empleados_del_Area.remove(Persona);
        Numero_de_Empleados=Empleados_del_Area.size();
        return S;
    }
    public int getSize()
    {
      return Empleados_del_Area.size();
    }
    public Clase_Persona Obtener_Empleado(int indice)
    {
        if (indice<getSize())
        {
          return Empleados_del_Area.get(indice);
        }
        return null;
    }
    public Clase_Persona getItem(int indice)
    {
        if (indice<getSize())
        {
          return Empleados_del_Area.get(indice);
        }
        return null;
    }
    public String getNombre_del_Area(){
        return Nombre_del_Area;
    }

    public void setNombre_del_Area(String Nombre_del_Area) {
        this.Nombre_del_Area = Nombre_del_Area;
    }

    public int getNumero_del_Area() {
        return Numero_del_Area;
    }

    public void setNumero_del_Area(int Numero_del_Area) {
        this.Numero_del_Area = Numero_del_Area;
    }

    public int getNumero_de_Empleados() {
        return Numero_de_Empleados;
    }

    public void setNumero_de_Empleados(int Numero_de_Empleados) {
        this.Numero_de_Empleados = Numero_de_Empleados;
    }
    
}
