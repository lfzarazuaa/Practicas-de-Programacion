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
public class Clase_Unidad {
   public String Nombre;
   public String Abreviatura;
   public double Factor;
   public double Incremento;
   public double Valor;
    public Clase_Unidad(String Nombre, String Abreviatura, double Factor) {
        this.Nombre = Nombre;
        this.Abreviatura = Abreviatura;
        this.Factor = Factor;
        this.Incremento=0;
        this.Valor=1;
    }
    
    public Clase_Unidad(String Nombre, String Abreviatura, double Factor, double Incremento) {
        this.Nombre = Nombre;
        this.Abreviatura = Abreviatura;
        this.Factor = Factor;
        this.Incremento = Incremento;
        this.Valor=1;
    }   
}
