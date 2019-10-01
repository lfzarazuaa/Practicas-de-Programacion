/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proyecto_001;

/**
 *
 * @author LuisFernando
 */
public class Area {
  private String Nombre_del_Area;
  private int Numero_del_Area; 
  private int Numero_de_Empleados;
  
  Area(String Nombre_del_Area, int Numero_del_Area,int Numero_de_Empleados){
  this.Nombre_del_Area=Nombre_del_Area;
  this.Numero_del_Area=Numero_del_Area;
  this.Numero_de_Empleados=Numero_de_Empleados;
  }
  
  void Modificar_Nombre_del_Area(String Nombre_del_Area){
   this.Nombre_del_Area=Nombre_del_Area;
  }
  
  void Modificar_Numero_del_Area(int Numero_del_Area){
   this.Numero_del_Area=Numero_del_Area;
  }
  
  void Modificar_Numero_de_Empleados(int Numero_de_Empleados){
   this.Numero_de_Empleados=Numero_de_Empleados;
  }
  
  String Obtener_Nombre_del_Area(){
   return Nombre_del_Area;
  }
  
  int Obtener_Numero_del_Area(){
   return Numero_del_Area;
  }
  
  int Obtener_Numero_de_Empleados(){
   return Numero_de_Empleados;
  }
}
