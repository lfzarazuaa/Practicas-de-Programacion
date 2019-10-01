/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package buscaminas;

/**
 *
 * @author LuisFernando
 */
public class Casilla {
  public boolean Bomba;
  public int Numero_Bombas;
  public boolean Estado;
  public int CoordenadaX,CoordenadaY;
  Casilla(){
    Bomba=false;
    Numero_Bombas=0;
    Estado=false;
    CoordenadaX=0;
    CoordenadaY=0;
  }
  Casilla(int CoordenadaX,int CoordenadaY){
    Bomba=false;
    Numero_Bombas=0;
    Estado=false;
    this.CoordenadaX=CoordenadaX;
    this.CoordenadaY=CoordenadaY;
  }
    public boolean isBomba() {
        return Bomba;
    }

    public void setBomba(boolean Bomba) {
        this.Bomba = Bomba;
    }

    public int getNumero_Bombas() {
        return Numero_Bombas;
    }

    public void setNumero_Bombas(int Numero_Bombas) {
        this.Numero_Bombas = Numero_Bombas;
    }

    public boolean isEstado() {
        return Estado;
    }

    public void setEstado(boolean Estado) {
        this.Estado = Estado;
    }
    
    public void setCoordenadas(int CoordenadaX,int CoordenadaY) {
        this.CoordenadaX = CoordenadaX;
        this.CoordenadaY = CoordenadaY;
    }
    
    public int Contar_Bombas(){
     int i=2;
     return i;
    }
}
