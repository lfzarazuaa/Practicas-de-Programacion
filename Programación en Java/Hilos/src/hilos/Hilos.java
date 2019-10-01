/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hilos;

/**
 *
 * @author LuisFernando
 */
public class Hilos{

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        Prueba test=new Prueba();
        Hilos01 H1=new Hilos01(1,test);
        Hilos02 H2=new Hilos02(2,test);
        Hilos03 H3=new Hilos03(test);
        H1.start();
        H2.start();
        H3.start();
    }
    
}
