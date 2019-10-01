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
public class Clase_Persona {
 public String Nombre;
 public String Apellido_Paterno;
 public String Apellido_Materno;
 public String Area;
 public String Contrasena;
 public String Usuario;
 public float Salario;
 public float Antiguedad;
 public int Edad;
 public int Numero_Usuario;
 public int Tipo_de_Empleado;
 public int Numero_Area;
 
 public Clase_Persona(){
  Nombre="Nombre";
  Apellido_Paterno="Apellido Paterno";
  Apellido_Materno="Apellido Materno";
  Salario=5000;
  Edad=25;
  Antiguedad=0;
  Area="Sin Asignar";
  Contrasena="123456";
  Numero_Usuario=-1;
  Tipo_de_Empleado=4;
 }
 public Clase_Persona(int Numero_Usuario_in,String Contrasena_in,String Area_in,int Tipo_Empleado_in){
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
 public Clase_Persona(String Nombre_in,String Apellido_Paterno_in,String Apellido_Materno_in,float Salario_in,int Edad_in,float Antiguedad_in,String Area_in,String Contrasena_in,int Numero_Usuario_in,int Tipo_Empleado_in){
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

    public Clase_Persona(String Nombre, String Apellido_Paterno, String Apellido_Materno, String Area, String Contrasena, String Usuario, float Salario, float Antiguedad, int Edad, int Numero_Usuario, int Tipo_de_Empleado, int Numero_Area) {
        this.Nombre = Nombre;
        this.Apellido_Paterno = Apellido_Paterno;
        this.Apellido_Materno = Apellido_Materno;
        this.Area = Area;
        this.Contrasena = Contrasena;
        this.Usuario = Usuario;
        this.Salario = Salario;
        this.Antiguedad = Antiguedad;
        this.Edad = Edad;
        this.Numero_Usuario = Numero_Usuario;
        this.Tipo_de_Empleado = Tipo_de_Empleado;
        this.Numero_Area = Numero_Area;
    }
 
    public String getNombre() {
        return Nombre;
    }

    public String getApellido_Paterno() {
        return Apellido_Paterno;
    }

    public String getApellido_Materno() {
        return Apellido_Materno;
    }
    
     public String getUsuario() {
        return Usuario;
    }
    public String getArea() {
        return Area;
    }

    public String getContrasena() {
        return Contrasena;
    }

    public float getSalario() {
        return Salario;
    }

    public float getAntiguedad() {
        return Antiguedad;
    }

    public int getEdad() {
        return Edad;
    }

    public int getNumero_Usuario() {
        return Numero_Usuario;
    }

    public int getTipo_de_Empleado() {
        return Tipo_de_Empleado;
    }

    public int getNumero_Area() {
        return Numero_Area;
    }
    
    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public void setApellido_Paterno(String Apellido_Paterno) {
        this.Apellido_Paterno = Apellido_Paterno;
    }

    public void setApellido_Materno(String Apellido_Materno) {
        this.Apellido_Materno = Apellido_Materno;
    }

    public void setArea(String Area) {
        this.Area = Area;
    }

    public void setContrasena(String Contrasena) {
        this.Contrasena = Contrasena;
    }

    public void setUsuario(String Usuario){
        this.Usuario = Usuario;
    }
    public void setUsuario(Clase_Usuario Usuario){
        this.Usuario = Usuario.getUsuario_S();
        this.Numero_Usuario =Usuario.getUsuario();
    }
    public void setSalario(float Salario) {
        this.Salario = Salario;
    }

    public void setAntiguedad(float Antiguedad) {
        this.Antiguedad = Antiguedad;
    }

    public void setEdad(int Edad) {
        this.Edad = Edad;
    }

    public void setNumero_Usuario(int Numero_Usuario) {
        this.Numero_Usuario = Numero_Usuario;
    }

    public void setTipo_de_Empleado(int Tipo_de_Empleado) {
        this.Tipo_de_Empleado = Tipo_de_Empleado;
    }

    public void setNumero_Area(int Numero_Area) {
        this.Numero_Area = Numero_Area;
    }
    public void setInformacion_Completa(String Nombre,String Apellido_Paterno,String Apellido_Materno,
            String Area,String Contrasena,String Usuario,float Salario,float Antiguedad,int Edad,int Numero_Usuario,
            int Tipo_de_Empleado,int Numero_Area){
        this.Nombre = Nombre;
        this.Apellido_Paterno = Apellido_Paterno;
        this.Apellido_Materno = Apellido_Materno;
        this.Area = Area;
        this.Contrasena = Contrasena;
        this.Usuario = Usuario;
        this.Salario = Salario;
        this.Antiguedad = Antiguedad;
        this.Edad = Edad;
        this.Numero_Usuario = Numero_Usuario;
        this.Tipo_de_Empleado = Tipo_de_Empleado;
        this.Numero_Area = Numero_Area;
    }
    public Clase_Persona getInformacion_Completa(){
     return new Clase_Persona(this.Nombre,this.Apellido_Paterno,this.Apellido_Materno,
                this.Area,this.Contrasena,this.Usuario,this.Salario,this.Antiguedad,
                this.Edad,this.Numero_Usuario,this.Tipo_de_Empleado,this.Numero_Area);
    }
    public void Desplegar_Opciones(){
        System.out.println("Modificar Información Personal");
    }
    
    public String[] Obtener_Opciones(){
       String Datos[]=new String[5];
         Datos[0]="Modificar Información Personal";
         Datos[1]="Modificar Información de otro Usuario";
         Datos[2]="Agregar Área";
         Datos[3]="Agregar Empleado";
         Datos[4]="Ver Personal";
         return Datos;
    }
    
    public String get_Tipo_de_Empleado(){
       return "Obrero";
    }
}
