package aplicacion01;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Sala1
 */
public class Carro {
    private String Propietario;
    private String Marca;
    private int Modelo;
  Carro(String P,String Ma, int Mo)
  {
    Propietario=P;
    Marca=Ma;
    Modelo=Mo;   
  }
  Carro()//Polimorfismo
  {
    Propietario="NULO";
    Marca="GENERICO";
    Modelo=1990;    
  }
  public void setModelo(int Mo)
  {
       Modelo=Mo;
  }
  
  public int getModelo()
  {
     return Modelo; 
  }
  
   public String getPropietario()
  {
     return Propietario; 
  }
   
    public String getMarca()
  {
     return Marca; 
  }
   
}
