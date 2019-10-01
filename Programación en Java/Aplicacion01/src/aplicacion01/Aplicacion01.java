/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package aplicacion01;

import java.util.Scanner;

/**
 *
 * @author Sala1
 */

public class Aplicacion01 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
     Scanner Opcion;
     ParkingAcceso UPIITA;
     UPIITA=new ParkingAcceso();
     int opc;
     Opcion=new Scanner(System.in);
     do
     {
       System.out.println("Bienvenido al Estacionamiento UPIITA");
       System.out.println("1-Agregar Automovil");
       System.out.println("2-Listar Automoviles");
       System.out.println("3-Verificar Acceso");
       System.out.println("5-Salir");
       opc=Opcion.nextInt();
       //IngresaCoche(UPIITA);
       switch(opc)
       {
           case 1: IngresaCoche(UPIITA);//Pasa un ParkingAcceso que contiene un Parking.
                   break;   
           case 2: ListarCoches(UPIITA);
                   break;
           case 3: VerificarCoche(UPIITA);
                   break;
       }
     }while(opc!=5);
    }
    public static boolean IngresaCoche(Parking P)
    {
     if (P==null)
     {System.out.println("Error al crear objeto");
         return false;}
     else
     {
      String Propietario;
      String Marca;
      int Modelo;
      Scanner Texto;
      Texto=new Scanner(System.in);
      System.out.println("Desea agregar información adicional (S/N)");
      if (Texto.nextLine().equals("S")){
      System.out.println("Ingrese el nombre del propietario:");
      Propietario=Texto.nextLine();
      System.out.println("Ingrese la marca del automovil:");
      Marca=Texto.nextLine();
      System.out.println("Ingrese el modelo");
      Modelo=Texto.nextInt();
      CarRegistro c;
      c=new CarRegistro(Propietario, Marca, Modelo);
      P.addCar(c);}
      else{
      CarRegistro c;
      c=new CarRegistro();
      P.addCar(c);       
      }
      return true;
    }
   }
     public static void ListarCoches(Parking p)//Acepta un objeto tipo Parking 
    {
     CarRegistro Aux;
     int i;
     int n=p.getNumCar();
     for (i=0;i<n;i++)
     {
       Aux=(CarRegistro)p.getCar(i);
       System.out.println(i+".-"+Aux.getModelo());
       System.out.println("Propietario: "+Aux.getPropietario());
       System.out.println("Marca: "+Aux.getMarca());
     }
    }
     
    public static void VerificarCoche(ParkingAcceso P)
    {
     Scanner Texto;
     Texto=new Scanner(System.in);
     System.out.println("Ingrese el numero de coches a verificar");
     int n=Texto.nextInt();
     CarRegistro C=(CarRegistro)P.getCar(n);
     if (C!=null){
         System.out.println("El acceso es: ");
         System.out.println(C.isAcceso());
     }
    }
}
