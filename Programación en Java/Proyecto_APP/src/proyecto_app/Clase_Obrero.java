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
public class Clase_Obrero extends Clase_Persona{
    public Clase_Obrero() {
        super();
        this.Tipo_de_Empleado=4;
    }
    public Clase_Obrero(String Nombre, String Apellido_Paterno, String Apellido_Materno, String Area, String Contrasena, String Usuario, float Salario, float Antiguedad, int Edad, int Numero_Usuario, int Numero_Area) {
        super(Nombre, Apellido_Paterno, Apellido_Materno, Area, Contrasena, Usuario, Salario, Antiguedad, Edad, Numero_Usuario, 4, Numero_Area);
    }
    
    @Override
    public void Desplegar_Opciones(){
        super.Desplegar_Opciones();
        System.out.println("Crear Reporte del día");
    }
    @Override
    public String[] Obtener_Opciones(){
       String Datos[]=new String[1];
         Datos[0]="Modificar Información Personal";
         return Datos;
    }
    @Override
    public String get_Tipo_de_Empleado(){
       return super.get_Tipo_de_Empleado();
    }
}
