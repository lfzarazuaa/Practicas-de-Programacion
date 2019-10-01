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
public class Numero_Compuesto {
 public double relativo,absoluto;
 public int nprefijo;    
 public String sprefijo;
 Numero_Compuesto(double relativo,int nprefijo){
   absoluto=Asignar_Valor(relativo,nprefijo);
   this.nprefijo=Encontrar_Prefijo(absoluto);
   this.relativo=absoluto/Math.pow(10,-12+3*this.nprefijo);
   sprefijo=Asignar_Prefijo(this.nprefijo);
 }
 Numero_Compuesto(double absoluto){
   this.absoluto=absoluto;
   this.nprefijo=Encontrar_Prefijo(absoluto);
   this.relativo=absoluto/Math.pow(10,-12+3*this.nprefijo);
   sprefijo=Asignar_Prefijo(this.nprefijo);
 }
  public String Redondear4(double Numero){
     String  A;
     A=String.format("%.4f %%",Numero);
     return A.replace("%","");
    }
 public void Actualizar_Numero(){
   absoluto=Asignar_Valor(relativo,nprefijo);
   nprefijo=Encontrar_Prefijo(absoluto);
   relativo=absoluto/Math.pow(10,-12+3*nprefijo);
   sprefijo=Asignar_Prefijo(nprefijo);
 }
 public void Actualizar_Numero(double relativo,int nprefijo){
   absoluto=Asignar_Valor(relativo,nprefijo);
   this.nprefijo=Encontrar_Prefijo(absoluto);
   this.relativo=absoluto/Math.pow(10,-12+3*this.nprefijo);
   sprefijo=Asignar_Prefijo(this.nprefijo);
 }
  public void Actualizar_Absoluto(double absoluto){
   this.absoluto=absoluto;
   this.nprefijo=Encontrar_Prefijo(absoluto);
   this.relativo=absoluto/Math.pow(10,-12+3*this.nprefijo);
   sprefijo=Asignar_Prefijo(this.nprefijo);
 }
    public double getRelativo() {
        return relativo;
    }

    public void setRelativo(double relativo) {
        this.relativo = relativo;
    }

    public double getAbsoluto() {
        return absoluto;
    }

    public void setAbsoluto(double absoluto) {
        this.absoluto = absoluto;
    }

    public int getNprefijo() {
        return nprefijo;
    }

    public void setNprefijo(int nprefijo) {
        this.nprefijo = nprefijo;
    }

    public String getSprefijo() {
        return sprefijo;
    }
    private String Asignar_Prefijo(int prefijo){
     switch (prefijo){
         case 0:
         sprefijo="p";
         return "p";
         case 1:
         sprefijo="n";
         return "n";
         case 2:
         sprefijo="u";
         return "u";
         case 3:
         sprefijo="m";
         return "m";
         case 4:
         sprefijo=" ";
         return " ";
         case 5:
         sprefijo="k";
         return "k";
         case 6:
         sprefijo="M";
         return "M";
         case 7:
         sprefijo="G";
         return "G";
         default:
         sprefijo=" ";
         return " ";
     }
    }
    private int Encontrar_Prefijo(double Cantidad){
     if (Cantidad<Math.pow(10,-9)){
      return 0;}
     else if(Cantidad<Math.pow(10,-6)){
      return 1;}    
     else if(Cantidad<Math.pow(10,-3)){
      return 2;}
     else if(Cantidad<Math.pow(10,0)){
      return 3;}
     else if(Cantidad<Math.pow(10,3)){
      return 4;}
     else if(Cantidad<Math.pow(10,6)){
      return 5;}
     else if(Cantidad<Math.pow(10,9)){
      return 6;}
     else{
      return 7;}
    }
    private double Asignar_Valor(double Cantidad,int Prefijo){
        switch (Prefijo){
         case 0:
         return Cantidad*Math.pow(10,-12);
         case 1:
         return Cantidad*Math.pow(10,-9);
         case 2:
         return Cantidad*Math.pow(10,-6);
         case 3:
         return Cantidad*Math.pow(10,-3);
         case 4:
         return Cantidad;
         case 5:
         return Cantidad*1000;
         case 6:
         return Cantidad*Math.pow(10,6);
         case 7:
         return Cantidad*Math.pow(10,9);
         default:
         return Cantidad;
     }        
    }
}
