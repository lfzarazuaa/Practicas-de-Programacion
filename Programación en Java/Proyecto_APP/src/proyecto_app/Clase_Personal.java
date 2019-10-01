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
public class Clase_Personal {
   public ArrayList <Clase_Area> Areas_de_la_Empresa;
    int Numero_de_Areas;
    int Numero_de_Integrantes;
    int Numero_de_Usuario;
     public Clase_Personal() {
        Areas_de_la_Empresa=new ArrayList(15);//Crea un arreglo con 15 espacios.
        Numero_de_Areas=0;
        Numero_de_Integrantes=0;
        Inicializar_Datos();
        Actualizar_Integrantes();
        System.out.println("Integrantes= "+Numero_de_Integrantes);
     }
     public int Verificar_Usuario(String Usuario,String Contrasena){
      String usuario_comparar,contrasena_comparar;
      Numero_de_Areas=Areas_de_la_Empresa.size();
      int j,i,limite;
      for (j=0;j<Numero_de_Areas;j++){
       limite=this.getItem(j).getSize();
       for(i=0;i<limite;i++){
        usuario_comparar=new String();
        usuario_comparar=this.getItem(j).getItem(i).getUsuario();
        if(Usuario.equals(usuario_comparar)){  
         contrasena_comparar=new String();
         contrasena_comparar=this.getItem(j).getItem(i).getContrasena();
         if (Contrasena.equals(contrasena_comparar)){
          return 0;//Contrasena y Usuario Correctos
         }
         else{
          return 1;//Contraseña incorrecta
         }
        }
       }
      }
      return 2;//Usuario y contraseña correctos.
     }
     public Clase_Identificador_de_Usuario Regresar_Usuario(String Usuario){
      Clase_Identificador_de_Usuario Identificador_de_Usuario;
      Identificador_de_Usuario=new Clase_Identificador_de_Usuario(0,0);
      String usuario_comparar;
      Numero_de_Areas=Areas_de_la_Empresa.size();
      int j,i,limite;
      for (j=0;j<Numero_de_Areas;j++){
       limite=this.getItem(j).getSize();
       for(i=0;i<limite;i++){
        usuario_comparar=new String();
        usuario_comparar=this.getItem(j).getItem(i).getUsuario();
        if(Usuario.equals(usuario_comparar)){
          Identificador_de_Usuario.Numero_de_Area=j;
          Identificador_de_Usuario.Numero_de_Empleado=i;
        }
       }
      }
      return Identificador_de_Usuario;
     }
     public void Agregar_Area(Clase_Area Area)
     {
       Areas_de_la_Empresa.add(Area);
       Numero_de_Areas=Areas_de_la_Empresa.size();
       Actualizar_Integrantes();
     }
     
     public void addItem(Clase_Area Area)
     {
       Areas_de_la_Empresa.add(Area);
       Numero_de_Areas=Areas_de_la_Empresa.size();
       Actualizar_Integrantes();
     }
     
     public void removeAllItems(){
       Areas_de_la_Empresa.clear();
       Numero_de_Areas=Areas_de_la_Empresa.size();
       Actualizar_Integrantes();
     }
 
     public int getSize()
     {
       return Areas_de_la_Empresa.size();
     }
     
     public Clase_Area getItem(int indice)
     {
        if (indice<getSize())
        {
          return Areas_de_la_Empresa.get(indice);
        }
        return null;
     }
    public boolean Usuario_Repetido(String Usuario){
     String usuario_comparar;
      Numero_de_Areas=Areas_de_la_Empresa.size();
      int j,i,limite;
      for (j=0;j<Numero_de_Areas;j++){
       limite=this.getItem(j).getSize();
       for(i=0;i<limite;i++){
        usuario_comparar=new String();
        usuario_comparar=this.getItem(j).getItem(i).getUsuario();
        if(Usuario.equals(usuario_comparar)){
          return true;
        }
       }
      }
       return false;
    }
    public Clase_Usuario Regresar_Numero_de_Usuario(){
        Numero_de_Usuario=Numero_de_Usuario+1;
        return new Clase_Usuario("usuario"+(Numero_de_Usuario-1),Numero_de_Usuario-1);
    }
    public boolean Quedar_con_Texto(String Dato){
     if (Dato.equals("")){
         return false;}
     else if (Dato.isEmpty()){
         return false;
     }
     else return !Dato.equals(" ");
    }
    public boolean Mismo_Usuario(String A,String B){
     return A.equals(B);
    }
    public boolean Determinar_Salario_Valido(String Salario){
     double Sal=Double.valueOf(Salario);
       return Sal>=0 && Sal<200e6;
    }
    public boolean Determinar_Antiguedad_Valida(String Antiguedad,String Edad){
      double Ant=Double.valueOf(Antiguedad);
      double Edad1=Double.valueOf(Edad);
       return (Ant>=0 && Ant<Edad1);
    }
    public boolean Determinar_Edad_Valida(String Antiguedad,String Edad){
      double Ant=Double.valueOf(Antiguedad);
      double Edad1=Double.valueOf(Edad);
      return (Edad1>0 && Ant<Edad1 && Edad1<150);
    }
    public boolean Contrasena_valida(String Contrasena){
       return Contrasena.length()>=6;
    }
    private void Actualizar_Integrantes() {
      int i,Empleados=0;
      int numero_areas=Areas_de_la_Empresa.size();
        //System.out.println("Areas= "+numero_areas);
        //System.out.println("Empleados= "+Empleados);
      for (i=0;i<numero_areas;i++){
        Empleados=Empleados+Areas_de_la_Empresa.get(i).getSize();
        //System.out.println("Empleados= "+Empleados);
      }
      Numero_de_Integrantes=Empleados;
    }
    private int Calcular_Numero_de_Empleado(){
      Actualizar_Integrantes();
      return Numero_de_Integrantes;
    }
     private String Calcular_Numero_de_Usuario(){
      return "usuario"+Calcular_Numero_de_Empleado();
    }
    private void Inicializar_Datos() {
      Clase_Persona Per;
      Clase_Gerente Gerente;
      Clase_Recursos_Humanos Recurso_Humano;
      Clase_Jefe Jefe;
      Clase_Ingeniero Ingeniero;
      Clase_Obrero Obrero;
      /*Per=new Clase_Persona("Francisco","Zarazua","Aguilar",
            Gerencia.getNombre_del_Area(),"123456","usuario1",145000,8,33,numero,
            0,Gerencia.getNumero_del_Area());*/
      //numero=numero+1;
      Clase_Area Gerencia=new Clase_Area("Gerencia",0);
      Per=new Clase_Persona("Luis Fernando","Zarazua","Aguilar",
            Gerencia.getNombre_del_Area(),"123456","usuario0",150000,8,44,3,
            0,Gerencia.getNumero_del_Area());
      Clase_Area Recursos_Humanos=new Clase_Area("Recursos Humanos",1);
      Clase_Area Electronica=new Clase_Area("Electrónica",2);
      Clase_Area Mecanica=new Clase_Area("Mecánica",3);
      Clase_Area Fisico_Matematicas=new Clase_Area("Fisico-Matemáticas",4);
      Clase_Area Ventas=new Clase_Area("Ventas",5);
      Clase_Area Materiales=new Clase_Area("Materiales",6);
      this.Agregar_Area(Gerencia);
      this.Agregar_Area(Recursos_Humanos);
      this.Agregar_Area(Electronica);
      this.Agregar_Area(Mecanica);
      this.Agregar_Area(Fisico_Matematicas);
      this.Agregar_Area(Ventas);
      this.Agregar_Area(Materiales);
      //Área 0 Gerencia
      Gerente=new Clase_Gerente("Luis Fernando","Zarazua","Aguilar","123456",Calcular_Numero_de_Usuario(),150000,8,44,Calcular_Numero_de_Empleado());
      Gerencia.Agregar_Empleado(Gerente);
      Gerente=new Clase_Gerente("Guillermo Alessandro","Alva","Gomez","123456",Calcular_Numero_de_Usuario(),145000,8,45,Calcular_Numero_de_Empleado());
      Gerencia.Agregar_Empleado(Gerente);
      //Gerencia.Agregar_Empleado(Per);
      //Área 1 Recursos Humanos
      Recurso_Humano=new Clase_Recursos_Humanos("Juan","Perez","Huerta","123456",Calcular_Numero_de_Usuario(),25000,7,38,Calcular_Numero_de_Empleado());
      Recursos_Humanos.Agregar_Empleado(Recurso_Humano);
      Recurso_Humano=new Clase_Recursos_Humanos("Ignacio","Flores","Herrera","123456",Calcular_Numero_de_Usuario(),28000,8,42,Calcular_Numero_de_Empleado());
      Recursos_Humanos.Agregar_Empleado(Recurso_Humano);
      Recurso_Humano=new Clase_Recursos_Humanos("Saul","Salazar","Jimenez","123456",Calcular_Numero_de_Usuario(),23000,5,34,Calcular_Numero_de_Empleado());
      Recursos_Humanos.Agregar_Empleado(Recurso_Humano);
      //Área 2 Eléctronica
      //String Nombre, String Apellido_Paterno, String Apellido_Materno, String Area, String Contrasena, String Usuario, float Salario, float Antiguedad, int Edad, int Numero_Usuario, int Numero_Area
      Jefe=new Clase_Jefe("Aaron","Meneses","Campos",this.getItem(2).getNombre_del_Area(),"123456",Calcular_Numero_de_Usuario(),60000,6,45,Calcular_Numero_de_Empleado(),this.getItem(2).getNumero_del_Area());
      Electronica.Agregar_Empleado(Jefe);
      Ingeniero=new Clase_Ingeniero("Laura Fernanda","Sosa","Roldan",this.getItem(2).getNombre_del_Area(),"123456",Calcular_Numero_de_Usuario(),32000,5,27,Calcular_Numero_de_Empleado(),this.getItem(2).getNumero_del_Area());
      Electronica.Agregar_Empleado(Ingeniero);
      Ingeniero=new Clase_Ingeniero("Paola","Larrañaga","Parrado",this.getItem(2).getNombre_del_Area(),"123456",Calcular_Numero_de_Usuario(),31500,4,32,Calcular_Numero_de_Empleado(),this.getItem(2).getNumero_del_Area());
      Electronica.Agregar_Empleado(Ingeniero);
      Obrero=new Clase_Obrero("Gabriel","Velazquez","Morales",this.getItem(2).getNombre_del_Area(),"123456",Calcular_Numero_de_Usuario(),9800,5,29,Calcular_Numero_de_Empleado(),this.getItem(2).getNumero_del_Area());
      Electronica.Agregar_Empleado(Obrero);
      Obrero=new Clase_Obrero("Mariano","Piembert","Casas",this.getItem(2).getNombre_del_Area(),"123456",Calcular_Numero_de_Usuario(),8500,2,25,Calcular_Numero_de_Empleado(),this.getItem(2).getNumero_del_Area());
      Electronica.Agregar_Empleado(Obrero);
      Obrero=new Clase_Obrero("Ciro","Gonzalez","Zugarazo",this.getItem(2).getNombre_del_Area(),"123456",Calcular_Numero_de_Usuario(),10000,6,40,Calcular_Numero_de_Empleado(),this.getItem(2).getNumero_del_Area());
      Electronica.Agregar_Empleado(Obrero);
      //Área 3 Mecánica
      Jefe=new Clase_Jefe("Nancy Martha","Venegas","Peña",this.getItem(3).getNombre_del_Area(),"123456",Calcular_Numero_de_Usuario(),55000,5,43,Calcular_Numero_de_Empleado(),this.getItem(3).getNumero_del_Area());
      Mecanica.Agregar_Empleado(Jefe);
      Ingeniero=new Clase_Ingeniero("Samanta Itzel","Rebollar","Lezama",this.getItem(3).getNombre_del_Area(),"123456",Calcular_Numero_de_Usuario(),33000,5,39,Calcular_Numero_de_Empleado(),this.getItem(3).getNumero_del_Area());
      Mecanica.Agregar_Empleado(Ingeniero);
      Ingeniero=new Clase_Ingeniero("Adriel Husai","Lamas","Mora",this.getItem(3).getNombre_del_Area(),"123456",Calcular_Numero_de_Usuario(),35000,4,38,Calcular_Numero_de_Empleado(),this.getItem(3).getNumero_del_Area());
      Mecanica.Agregar_Empleado(Ingeniero);
      Obrero=new Clase_Obrero("Daniel Isaac","Trujillo","Lopez",this.getItem(3).getNombre_del_Area(),"123456",Calcular_Numero_de_Usuario(),7500,3,42,Calcular_Numero_de_Empleado(),this.getItem(3).getNumero_del_Area());
      Mecanica.Agregar_Empleado(Obrero);
      Obrero=new Clase_Obrero("Pamela","Garcia","Mercado",this.getItem(3).getNombre_del_Area(),"123456",Calcular_Numero_de_Usuario(),6300,1,25,Calcular_Numero_de_Empleado(),this.getItem(3).getNumero_del_Area());
      Mecanica.Agregar_Empleado(Obrero);
      Obrero=new Clase_Obrero("Frida Johanan","Angeles","Heras",this.getItem(3).getNombre_del_Area(),"123456",Calcular_Numero_de_Usuario(),9200,2,47,Calcular_Numero_de_Empleado(),this.getItem(3).getNumero_del_Area());
      Mecanica.Agregar_Empleado(Obrero);
      Obrero=new Clase_Obrero("Luis Eduardo","Mendoza","Quintamar",this.getItem(3).getNombre_del_Area(),"123456",Calcular_Numero_de_Usuario(),11500,7,50,Calcular_Numero_de_Empleado(),this.getItem(3).getNumero_del_Area());
      Mecanica.Agregar_Empleado(Obrero);
      Obrero=new Clase_Obrero("Dante Ismael","Massimino","Meneses",this.getItem(3).getNombre_del_Area(),"123456",Calcular_Numero_de_Usuario(),7800,3,33,Calcular_Numero_de_Empleado(),this.getItem(3).getNumero_del_Area());
      Mecanica.Agregar_Empleado(Obrero);
      //Área 4 Físico-Matemáticas
      Jefe=new Clase_Jefe("Luis Felipe","Garcia","Ojeda",this.getItem(4).getNombre_del_Area(),"123456",Calcular_Numero_de_Usuario(),49000,7,48,Calcular_Numero_de_Empleado(),this.getItem(4).getNumero_del_Area());
      Fisico_Matematicas.Agregar_Empleado(Jefe);
      Ingeniero=new Clase_Ingeniero("Ana Cristina","Rodríguez","Ruiz",this.getItem(4).getNombre_del_Area(),"123456",Calcular_Numero_de_Usuario(),27000,3,27,Calcular_Numero_de_Empleado(),this.getItem(4).getNumero_del_Area());
      Fisico_Matematicas.Agregar_Empleado(Ingeniero);
      Ingeniero=new Clase_Ingeniero("Debora Miriam","Vieyra","Medina",this.getItem(4).getNombre_del_Area(),"123456",Calcular_Numero_de_Usuario(),23500,1,24,Calcular_Numero_de_Empleado(),this.getItem(4).getNumero_del_Area());
      Fisico_Matematicas.Agregar_Empleado(Ingeniero);
      Ingeniero=new Clase_Ingeniero("Cuauhtémoc Daniel","Salgado","Parada",this.getItem(4).getNombre_del_Area(),"123456",Calcular_Numero_de_Usuario(),21000,1,24,Calcular_Numero_de_Empleado(),this.getItem(4).getNumero_del_Area());
      Fisico_Matematicas.Agregar_Empleado(Ingeniero);
      Obrero=new Clase_Obrero("Luisa Fernanda","Perez","Zamora",this.getItem(4).getNombre_del_Area(),"123456",Calcular_Numero_de_Usuario(),5500,1,21,Calcular_Numero_de_Empleado(),this.getItem(4).getNumero_del_Area());
      Fisico_Matematicas.Agregar_Empleado(Obrero);
      //Área 5 Ventas
      Jefe=new Clase_Jefe("Daniela Nicole","Basurto","Rueda",this.getItem(5).getNombre_del_Area(),"123456",Calcular_Numero_de_Usuario(),68000,4,46,Calcular_Numero_de_Empleado(),this.getItem(5).getNumero_del_Area());
      Ventas.Agregar_Empleado(Jefe);
      Ingeniero=new Clase_Ingeniero("Aline","Flores","Gutierrez",this.getItem(5).getNombre_del_Area(),"123456",Calcular_Numero_de_Usuario(),41000,4,39,Calcular_Numero_de_Empleado(),this.getItem(5).getNumero_del_Area());
      Ventas.Agregar_Empleado(Ingeniero);
      Obrero=new Clase_Obrero("Vanessa","Ortiz","Ibarra",this.getItem(5).getNombre_del_Area(),"123456",Calcular_Numero_de_Usuario(),10000,3,31,Calcular_Numero_de_Empleado(),this.getItem(5).getNumero_del_Area());
      Ventas.Agregar_Empleado(Obrero);
      //Área 6 Materiales
      Jefe=new Clase_Jefe("Melany Monserrat","Rosales","Rodriguez",this.getItem(6).getNombre_del_Area(),"123456",Calcular_Numero_de_Usuario(),45000,5,44,Calcular_Numero_de_Empleado(),this.getItem(6).getNumero_del_Area());
      Materiales.Agregar_Empleado(Jefe);
      Ingeniero=new Clase_Ingeniero("Gerardo","Santos","Correa",this.getItem(6).getNombre_del_Area(),"123456",Calcular_Numero_de_Usuario(),36000,4,33,Calcular_Numero_de_Empleado(),this.getItem(6).getNumero_del_Area());
      Materiales.Agregar_Empleado(Ingeniero);
      Obrero=new Clase_Obrero("Berenice Estefania","Perez","Molina",this.getItem(6).getNombre_del_Area(),"123456",Calcular_Numero_de_Usuario(),12000,4,45,Calcular_Numero_de_Empleado(),this.getItem(6).getNumero_del_Area());
      Materiales.Agregar_Empleado(Obrero);
      Obrero=new Clase_Obrero("Jose Alberto","De Leon","Fonseca",this.getItem(6).getNombre_del_Area(),"123456",Calcular_Numero_de_Usuario(),9000,2,29,Calcular_Numero_de_Empleado(),this.getItem(6).getNumero_del_Area());
      Materiales.Agregar_Empleado(Obrero);
      Obrero=new Clase_Obrero("Rafael Israel","Sosa","Perez",this.getItem(6).getNombre_del_Area(),"123456",Calcular_Numero_de_Usuario(),8500,4,34,Calcular_Numero_de_Empleado(),this.getItem(6).getNumero_del_Area());
      Materiales.Agregar_Empleado(Obrero);
      Obrero=new Clase_Obrero("Hugo","Rojas","Arce",this.getItem(6).getNombre_del_Area(),"123456",Calcular_Numero_de_Usuario(),9500,3,43,Calcular_Numero_de_Empleado(),this.getItem(6).getNumero_del_Area());
      Materiales.Agregar_Empleado(Obrero);
      System.out.println(""+this.getItem(6).getItem(5).getUsuario());
      Numero_de_Usuario=Numero_de_Integrantes+1;
      /*Gerencia.getItem(0).Desplegar_Opciones();
      Gerencia.getItem(2).Desplegar_Opciones();
      System.out.println(""+Gerencia.getItem(0).getNumero_Usuario());
      System.out.println(""+Gerencia.getItem(1).getNumero_Usuario());*/
    }
}
