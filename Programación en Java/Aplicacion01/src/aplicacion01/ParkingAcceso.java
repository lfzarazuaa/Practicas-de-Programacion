/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package aplicacion01;

/**
 *
 * @author Sala1
 */
public class ParkingAcceso extends Parking{
 ParkingAcceso(){//Constructor
  super();   
 }
 
 public boolean GetAcceso(CarRegistro C){
     return C.isAcceso();
 }
}