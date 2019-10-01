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
public class Hilos03 extends Thread{
  Prueba P;
    public Hilos03(Prueba P) {
        this.P = P;
    }
  @Override
    public void run(){
        while(true){
            System.out.println("Hilos3,"+P.getNumero());
        }
    }
}
