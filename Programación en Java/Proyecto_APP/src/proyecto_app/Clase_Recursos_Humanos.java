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
public class Clase_Recursos_Humanos extends Clase_Persona{
    
     public Clase_Recursos_Humanos() {
        super();
        this.Numero_Area=1;
        this.Tipo_de_Empleado=1;
    }
    public Clase_Recursos_Humanos(String Nombre, String Apellido_Paterno, String Apellido_Materno, String Contrasena, String Usuario, float Salario, float Antiguedad, int Edad, int Numero_Usuario){
        super(Nombre, Apellido_Paterno, Apellido_Materno,"Recursos Humanos", Contrasena, Usuario, Salario, Antiguedad, Edad, Numero_Usuario,1,1);
    }

    public Clase_Recursos_Humanos(String Nombre, String Apellido_Paterno, String Apellido_Materno, String Area, String Contrasena, String Usuario, float Salario, float Antiguedad, int Edad, int Numero_Usuario){
        super(Nombre, Apellido_Paterno, Apellido_Materno, Area, Contrasena, Usuario, Salario, Antiguedad, Edad, Numero_Usuario,1,1);
    }
     @Override
    public void Desplegar_Opciones(){
        super.Desplegar_Opciones();
        System.out.println("Modificar Información de otro Usuario");
        System.out.println("Agregar Área");
        System.out.println("Agregar Empleado");
        System.out.println("Ver Personal a cargo");
    }
    @Override
    public String[] Obtener_Opciones(){
       String Datos[]=new String[5];
         Datos[0]="Modificar Información Personal";
         Datos[1]="Modificar Información de otro Usuario";
         Datos[2]="Agregar Área";
         Datos[3]="Agregar Empleado";
         Datos[4]="Ver Personal";
         return Datos;
    }
    @Override
    public String get_Tipo_de_Empleado(){
       return "Recursos Humanos";
    }
}
