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
public class Campo {
 public Casilla Casillas[][];
 public int bombas,Casillas_marcadas;
 public int xmax,ymax;
 Campo(){
  int i,j;
  Casillas_marcadas=0;
  xmax=7;
  ymax=6;
  Casillas=new Casilla[xmax][ymax];
   for(j=0;j<ymax;j++){
    for(i=0;i<xmax;i++){
        Casillas[i][j]=new Casilla(i,j);
    }
   }
 }

    public int getXmax() {
        return xmax;
    }

    public int getYmax() {
        return ymax;
    }

    public int getCasillas_marcadas() {
        return Casillas_marcadas;
    }
    public void setCasillas_marcadas(int Casillas_marcadas) {
        this.Casillas_marcadas = Casillas_marcadas;
    }
    public void Incrementar_Casilla_Marcada(){
     this.Casillas_marcadas=getCasillas_marcadas()+1;
    }
    public boolean Determinar_Juego_Ganado(){
     int Casillas_disponibles;
     Casillas_disponibles=(xmax*ymax)-bombas;
     return(Casillas_marcadas==Casillas_disponibles);
    }
 Campo(int xmax,int ymax){
  Casillas_marcadas=0;
  int i,j;
  this.xmax=xmax;
  this.ymax=ymax;
  Casillas=new Casilla[xmax][ymax];
   for(j=0;j<6;j++){
    for(i=0;i<7;i++){
        Casillas[i][j]=new Casilla(i,j);
    }
   }
 }
 public boolean Inicializar_Bombas(int bombas)
 {
    int i,numero1,numero2,n1,n2;
    int x,y;
    boolean rep;
    int[][] M=new int[2][bombas];
    n1=xmax-1;
    n2=ymax-1;
    this.bombas=bombas;
    for(i=0;i<bombas;i++){
     rep=true;
     while(rep){
      numero1=(int)(Math.random()*n1);
      numero2=(int)(Math.random()*n2);
      M[0][i]=numero1;
      M[1][i]=numero2;
      //rep=false;}
      rep=Determinar_Repeticion(M,i);
      if (rep){
          //System.out.println("Determinar Siguiente");
          Determinar_Siguiente(M,numero1,numero2,i);
      }
      rep=Determinar_Repeticion(M,i);
     }
    }
    for(i=0;i<bombas;i++){
     x=M[0][i];
     y=M[1][i];
     //System.out.println("C("+i+")="+x+","+y);
     Casillas[x][y].setBomba(true);
    }
    return true;
 }
 public boolean Determinar_Siguiente(int M[][],int x,int y,int num){
   int i,j;
   boolean rep = true;
   j=y;
    if(x+1<xmax){
    for(i=x+1;i<xmax;i++){
      M[0][num]=i;
      M[1][num]=j;
      //System.out.println("i="+i+",j="+j);
      rep=Determinar_Repeticion(M,num);
      if(!rep){
      return rep;}
    }}
   if(y+1<ymax){
   for(j=y+1;j<ymax;j++){
    for(i=0;i<xmax;i++){
      M[0][num]=i;
      M[1][num]=j;
      //System.out.println("i="+i+",j="+j);
      rep=Determinar_Repeticion(M,num);
      if(!rep){
      return rep;}      
    }
   }}
   for(j=0;j<ymax;j++){
    for(i=0;i<xmax;i++){
      M[0][num]=i;
      M[1][num]=j;
      //System.out.println("i="+i+",j="+j);
      rep=Determinar_Repeticion(M,num);
      if(!rep){
      return rep;}      
    }
   }
   return rep;   
 }
 public boolean Determinar_Repeticion(int M[][],int num){
    int x,y,i;
     if (num>0){
     //System.out.println("bomba="+ num +","); 
     x=M[0][num];
     y=M[1][num];
     for(i=0;i<num-1;i++){
      //System.out.println("i="+i+",");
      if((x==M[0][i])&&(y==M[1][i])){
       return true;}
      }
      if((x-M[0][i]+y-M[1][i])==0){
       return true;
      }
      //System.out.println(x+","+y+" es no repetido"); 
     }
    return false; 
 }
 public boolean Cargar_Numero(){
   int i,j,x,y,contador;
   //int[][] n=new int[2][8];//Casillas aledañas
   for(j=0;j<ymax;j++){
    for(i=0;i<xmax;i++){
       contador=0;
        //Combinación 1;
       x=i-1;
       y=j-1;
       if(x>=0 && y>=0){
        if(Casillas[x][y].isBomba()){
        contador++;
        }
       }
       //Combinación 2;
       x=i-1;
       y=j;
       if(x>=0){
        if(Casillas[x][y].isBomba()){
        contador++;
        }
       }
       //Combinación 3;
       x=i-1;
       y=j+1;
       if(x>=0 && y<ymax){
        if(Casillas[x][y].isBomba()){
        contador++;
        }
       }
       //Combinación 4;
       x=i;
       y=j-1;
       if(y>=0){
        if(Casillas[x][y].isBomba()){
        contador++;
        }
       }
       //Combinación 5;
       x=i;
       y=j+1;
       if(y<ymax){
        if(Casillas[x][y].isBomba()){
        contador++;
        }
       }
       //Combinación 6;
       x=i+1;
       y=j-1;
       if(x<xmax && y>=0){
        if(Casillas[x][y].isBomba()){
        contador++;
        }
       }
       //Combinación 7;
       x=i+1;
       y=j;
       if(x<xmax){
        if(Casillas[x][y].isBomba()){
        contador++;
        }
       }
       //Combinación 8;
       x=i+1;
       y=j+1;
       if(x<xmax && y<ymax){
        if(Casillas[x][y].isBomba()){
        contador++;
        }
       }
       /* //Combinación 1;
       n[0][1]=i-1;
       n[1][1]=j-1;
       //Combinación 2;
       n[0][2]=i-1;
       n[1][2]=j;
       //Combinación 3;
       n[0][3]=i-1;
       n[1][3]=j+1;
       //Combinación 4;
       n[0][4]=i;
       n[1][4]=j-1;
       //Combinación 5;
       n[0][5]=i;
       n[1][5]=j+1;
       //Combinación 6;
       n[0][6]=i+1;
       n[1][6]=j-1;
       //Combinación 7;
       n[0][7]=i+1;
       n[1][7]=j;
       //Combinación 8;
       n[0][8]=i+1;
       n[1][8]=j+1;*/
       if (Casillas[i][j].isBomba()){
       Casillas[i][j].setNumero_Bombas(9);}
       else{
       Casillas[i][j].setNumero_Bombas(contador);}
       
    }
   }  
  return true;
 }
 public int Imprimir_Bombas(int CoordenadaX,int CoordenadaY){
    return Casillas[CoordenadaX][CoordenadaY].getNumero_Bombas();
 }
}
