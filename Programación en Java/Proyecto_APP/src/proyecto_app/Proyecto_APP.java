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
public class Proyecto_APP {
   public static Clase_Personal Personal=new Clase_Personal();
   public static Ventana_Bienvenida Bienvenida=new Ventana_Bienvenida();
   public static Menu_Principal Principal=new Menu_Principal();
   public static Ventana_Ley_de_Ohm Ley_de_Ohm=new Ventana_Ley_de_Ohm();
   public static Panel_opcion Panel_Opcion=new Panel_opcion();
   public static Ventana_Filtros Filtros=new Ventana_Filtros();
   public static Ventana_NE555 NE555=new Ventana_NE555();
   public static Clase_Magnitudes_Fisicas Magnitudes_Fisicas=new Clase_Magnitudes_Fisicas();
   public static Ventana_Conversor_Unidades Conversor_Unidades=new Ventana_Conversor_Unidades();
   public static Ventana_Edicion_de_Datos Edicion_de_Datos=new Ventana_Edicion_de_Datos();
   public static Ventana_Agregar_Empleados Agregar_Empleados=new Ventana_Agregar_Empleados();
   public static Ventana_Nueva_Area Nueva_Area=new Ventana_Nueva_Area();
   public static Ventana_Ver_Personal Ver_Personal=new Ventana_Ver_Personal();
   public static Ventana_Comunicacion_Serial Comunicacion_Serial=new Ventana_Comunicacion_Serial();
   /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        Bienvenida.InicializarGUI();
        Bienvenida.setVisible(true);
        //Filtros.setVisible(true);
        //NE555.setVisible(true);
        //Conversor_Unidades.setVisible(true);
    }
}