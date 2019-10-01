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
public class Hilos01 extends Thread{
   Prueba P;
    int Id;
   Hilos01(int Id,Prueba P){
    this.Id=Id;
    this.P=P;
   }
   @Override
   public void run(){
    while(true){
        System.out.println("Hilo_1,"+Id);
    }
   }
}
