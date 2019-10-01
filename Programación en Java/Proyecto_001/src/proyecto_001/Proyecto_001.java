/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proyecto_001;
import java.util.Scanner;
/**
 *
 * @author LuisFernando
 */
public class Proyecto_001 {
     /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
     Scanner Escaneo;
     Escaneo=new Scanner(System.in);
     Personal Personal_Empresa;
     Personal_Empresa=new Personal();
     int opc;
     System.out.println("Bienvenido al gestor de la empresa.");     
     do
     {
       System.out.println("Seleccione la opcion a realizar: "); 
       System.out.println("1) Ingresar datos.");
       System.out.println("5) Salir del gestor."); 
       opc=Escaneo.nextInt();
       switch(opc)
       {
           case 1: Ingreso(Personal_Empresa);//
                   break;
       }
     }while(opc!=5);
    }
    public static boolean Ingreso(Personal P)
    {
      Scanner Escaneo;
      Escaneo=new Scanner(System.in);
      int Numero_Usuario;
      String Contrasena;
      System.out.println("Ingrese su número de usuario:");
      Numero_Usuario=Escaneo.nextInt();
      System.out.println("Ingrese su contraseña:");
      Contrasena=Escaneo.nextLine();
      Contrasena=Escaneo.nextLine();
      if(P.Obtener_Datos(Numero_Usuario)!=null){
       if (Contrasena.equals(P.Obtener_Datos(Numero_Usuario).Contrasena)){
       System.out.println("Contraseña correcta.");
       Persona Ingresada;
       Ingresada=P.Obtener_Datos(Numero_Usuario);
       Verificar_Tipo_Empleado(P,Ingresada);
       return true;
       }
      else{
       System.out.println("Contraseña incorrecta");
       }
      }
      else{
        System.out.println("Usuario Inexistente");
      }
      return false;
    }
    
    public static boolean Verificar_Tipo_Empleado(Personal Empresa,Persona P)
    {
      int Tipo_de_Empleado=P.Tipo_de_Empleado;
      switch(Tipo_de_Empleado){
        case 1: Gerente GerenteA;
                GerenteA=(Gerente)P;
                GerenteA.Desplegar_Opciones(Empresa,GerenteA);
                break;
        case 2: Recursos_Humanos Recursos_HumanosA;
                Recursos_HumanosA=(Recursos_Humanos)P;
                Recursos_HumanosA.Desplegar_Opciones(Empresa,Recursos_HumanosA);
                break;
      }
      return true;
    }
}