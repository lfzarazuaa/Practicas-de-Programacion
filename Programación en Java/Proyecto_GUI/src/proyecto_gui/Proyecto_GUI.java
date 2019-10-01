/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proyecto_gui;

/**
 *
 * @author LuisFernando
 */
public class Proyecto_GUI {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        Ingreso Ventana_Ingreso=new Ingreso();
        Menu_Usuario Ventana_Usuario=new Menu_Usuario();
        Menu_Operaciones Ventana_Operaciones=new Menu_Operaciones();
        Ventana_Ingreso.Init();
        Ventana_Usuario.Init();
        Ventana_Operaciones.Init();
    }    
}
