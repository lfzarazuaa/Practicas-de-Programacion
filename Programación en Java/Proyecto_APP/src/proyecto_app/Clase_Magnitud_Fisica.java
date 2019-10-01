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
public class Clase_Magnitud_Fisica{
     ArrayList <Clase_Unidad> Unidades_Fisicas;
     int Numero_de_Unidades;
     String Nombre;
     public Clase_Magnitud_Fisica(String Nombre) {
       this.Nombre=Nombre;
       Unidades_Fisicas=new ArrayList(15);//Crea un arreglo con 15 espacios.
       Numero_de_Unidades=0;
     }
     public void Agregar_Unidad(String Nombre, String Abreviatura, double Factor){
      Unidades_Fisicas.add(new Clase_Unidad(Nombre,Abreviatura,Factor));
      Numero_de_Unidades=Unidades_Fisicas.size();
     }
     public void addItem(Clase_Unidad Unidad)
     {
      Unidades_Fisicas.add(Unidad);
      Numero_de_Unidades=Unidades_Fisicas.size();
     }
     public void removeAllItems(){
      Unidades_Fisicas.clear();
      Numero_de_Unidades=Unidades_Fisicas.size();
     }
     public int getSize()
     {
      return Unidades_Fisicas.size();
     }
     public Clase_Unidad getItem(int indice)
     {
        if (indice<getSize())
        {
          return Unidades_Fisicas.get(indice);
        }
        return null;
     }
      public Clase_Unidad Realizar_Conversion(double Valor,int Unidad1,int Unidad2){
        Clase_Unidad UnidadA=getItem(Unidad1);
        Clase_Unidad UnidadB=getItem(Unidad2);
        UnidadA.Valor=Valor;
        double Unidad_Principal=(UnidadA.Valor+UnidadB.Incremento)*UnidadA.Factor;
        UnidadB.Valor=(Unidad_Principal/UnidadB.Factor)-UnidadB.Incremento;
        return UnidadB;
      }
      public void Realizar_Conversion(Clase_Unidad UnidadA,Clase_Unidad UnidadB){
        double Unidad_Principal=(UnidadA.Valor+UnidadB.Incremento)*UnidadA.Factor;
        UnidadB.Valor=(Unidad_Principal/UnidadB.Factor)-UnidadB.Incremento;
        //return UnidadB;
      }
      /*public Clase_Unidad Realizar_Conversion(Clase_Unidad UnidadA,Clase_Unidad UnidadB){
        double Unidad_Principal=(UnidadA.Valor+UnidadB.Incremento)*UnidadA.Factor;
        UnidadB.Valor=(Unidad_Principal/UnidadB.Factor)-UnidadB.Incremento;
        return UnidadB;
      }*/
}