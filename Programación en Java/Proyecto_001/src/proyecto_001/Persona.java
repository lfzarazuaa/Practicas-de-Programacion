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
public class Persona {
 private String Nombre;
 private String Apellido_Paterno;
 private String Apellido_Materno;
 public String Area;
 public String Contrasena;
 private float Salario;
 private float Antiguedad;
 private int Edad;
 public int Numero_Usuario;
 public int Tipo_de_Empleado;
 
 Persona(){
  Nombre="Sin Asignar";
  Apellido_Paterno="Sin Asignar";
  Apellido_Materno="Sin Asignar";
  Salario=0;
  Edad=18;
  Antiguedad=0;
  Area="Sin Asignar";
  Contrasena="Empresa";
  Numero_Usuario=-1;
  Tipo_de_Empleado=5;
 }
 Persona(int Numero_Usuario_in,String Contrasena_in,String Area_in,int Tipo_Empleado_in){
  Nombre="Sin Asignar";
  Apellido_Paterno="Sin Asignar";
  Apellido_Materno="Sin Asignar";
  Salario=0;
  Edad=18;
  Antiguedad=0;
  Numero_Usuario=Numero_Usuario_in;
  Contrasena=Contrasena_in;
  Area=Area_in;
  Tipo_de_Empleado=Tipo_Empleado_in;
 }
 Persona(String Nombre_in,String Apellido_Paterno_in,String Apellido_Materno_in,float Salario_in,int Edad_in,float Antiguedad_in,String Area_in,String Contrasena_in,int Numero_Usuario_in,int Tipo_Empleado_in){
  Nombre=Nombre_in;
  Apellido_Paterno=Apellido_Paterno_in;
  Apellido_Materno=Apellido_Materno_in;
  Salario=Salario_in;
  Edad=Edad_in;
  Antiguedad=Antiguedad_in;
  Area=Area_in;
  Contrasena=Contrasena_in;
  Numero_Usuario=Numero_Usuario_in;
  Tipo_de_Empleado=Tipo_Empleado_in;
 }
 
 public void Modificar_Area(String Area){
  this.Area=Area;
 }

 
 public void Visualizar_Informacion(Persona P){
     System.out.println("Nombre: "+Nombre);
     System.out.println("Apellido Paterno: "+Apellido_Paterno);
     System.out.println("Apellido Materno: "+Apellido_Materno);
     System.out.println("Salario: "+Salario);
     System.out.println("Edad: "+Edad);
     System.out.println("Antiguedad: "+Antiguedad);
     System.out.println("Area: "+Area);
     System.out.println("Contrasena: "+Contrasena);
     System.out.println("Numero Usuario: "+Numero_Usuario);
     System.out.println("Tipo_de_Empleado: "+Tipo_de_Empleado);
 }
 
 public void Modifcar_Informacion_Completa(Persona P){
     Scanner Escaneo;
     Escaneo=new Scanner(System.in);
     System.out.println("Ingrese su Nombre: ");
     Nombre=Escaneo.nextLine();
     System.out.println("Ingrese su Apellido Paterno: "+Apellido_Paterno);
     Apellido_Paterno=Escaneo.nextLine();
     System.out.println("Ingrese su Apellido Materno: "+Apellido_Materno);
     Apellido_Materno=Escaneo.nextLine();
     System.out.println("Inrese el Salario: "+Salario);
     Salario=Escaneo.nextInt();
     System.out.println("Ingrese su Edad: "+Edad);
     Edad=Escaneo.nextInt();
     System.out.println("Ingrese su Antiguedad: "+Antiguedad);
     Antiguedad=Escaneo.nextInt();
     System.out.println("Ingrese la Contrasena: "+Contrasena);
     Contrasena=Escaneo.nextLine();
     Contrasena=Escaneo.nextLine();
 }
}