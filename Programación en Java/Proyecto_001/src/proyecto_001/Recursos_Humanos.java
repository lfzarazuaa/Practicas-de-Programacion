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
public class Recursos_Humanos extends Persona{
  Recursos_Humanos(){
    super();
   }
   Recursos_Humanos(int Numero_Usuario_in,String Contrasena_in,String Area_in){
    super(Numero_Usuario_in,Contrasena_in,Area_in,2);
   }
   Recursos_Humanos(String Nombre_in,String Apellido_Paterno_in,String Apellido_Materno_in,float Salario_in,int Edad_in,float Antiguedad_in,String Area_in,String Contrasena_in,int Numero_Usuario_in){
    super(Nombre_in,Apellido_Paterno_in,Apellido_Materno_in,Salario_in,Edad_in,Antiguedad_in,Area_in,Contrasena_in,Numero_Usuario_in,2);
   }
   
   public void Desplegar_Opciones(Personal Empresa,Persona P){//Modificable en la interfaz
       Scanner Escaneo;
       int opc;
       Escaneo=new Scanner(System.in);
       do{
       System.out.println("Bienvenido al gestor de Recusos Humanos"); 
       System.out.println("1) Visualizar Información."); 
       System.out.println("2) Modificar Información.");
       System.out.println("3) Agregar Personal.");
       System.out.println("4) Agregar Área."); 
       System.out.println("7) Cerrar sesión."); 
       opc=Escaneo.nextInt();
       switch(opc)
       {
           case 1: Visualizar_Informacion(P);//
                   break;
           case 2: Modifcar_Informacion_Completa(P);//
                   break;
       }
       }while(opc!=7);      
   }
}
