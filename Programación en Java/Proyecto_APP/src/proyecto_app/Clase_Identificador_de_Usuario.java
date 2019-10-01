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
public class Clase_Identificador_de_Usuario {
    public int Numero_de_Area;
    public int Numero_de_Empleado;

    public Clase_Identificador_de_Usuario() {
        this.Numero_de_Area = 0;
        this.Numero_de_Empleado = 0;
    }
    
    public Clase_Identificador_de_Usuario(int Numero_de_Area, int Numero_de_Empleado) {
        this.Numero_de_Area = Numero_de_Area;
        this.Numero_de_Empleado = Numero_de_Empleado;
    }
}
