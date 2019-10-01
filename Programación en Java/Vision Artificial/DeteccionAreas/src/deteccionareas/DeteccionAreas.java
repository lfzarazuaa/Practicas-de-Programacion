/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package deteccionareas;

import java.util.Stack;
import java.util.Vector;

/**
 *
 * @author ivazq
 */
public class DeteccionAreas {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        int Areas[][]={
        {0,0,0,0,0,0,0,0,0,0,9,9,9,9,9},
        {0,0,0,0,0,0,0,0,0,0,9,0,0,0,9},
        {0,0,0,0,0,0,0,0,0,0,9,9,9,9,9},
        {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {9,9,9,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,9,0,0,0,0,0,0,0,9,9,0,0,0},
        {0,0,9,0,0,0,0,0,0,9,0,0,9,0,0},
        {9,9,9,0,0,0,0,0,0,0,9,9,0,0,0},
        {0,0,0,0,0,8,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,8,0,8,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,8,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,9,9,0,0,0,0,0,0,0},
        {0,0,0,0,0,9,0,0,9,0,0,0,0,0,0},
        {0,0,0,0,0,9,0,0,0,9,0,0,0,0,0},
        {0,0,0,0,0,9,0,0,0,0,9,0,0,0,0}};
        int Ancho=15,Alto=15; // Obtener tamaño de la imagen
        int i,j,Y,X;
        Stack <Integer> AnalizarX;
        Stack <Integer> AnalizarY;
        
        AnalizarX=new Stack<Integer>();
        AnalizarY=new Stack<Integer>();       
        int Area=0;
        for(i=0;i<Ancho;i++)
        {
            for(j=0;j<Alto;j++)
            {
                if (Areas[i][j]==0)
                { 
                    Area++;
                    AnalizarX.push(i);
                    AnalizarY.push(j);
                }
                while(AnalizarX.isEmpty()!=true)
                {
                    X=AnalizarX.pop();
                    Y=AnalizarY.pop();                   
                    Areas[X][Y]=Area;
                    
                    if ((X+1)<Ancho)
                    {
                        if (Areas[X+1][Y]==0)
                        {
                            AnalizarX.push(X+1);
                            AnalizarY.push(Y);
                        }
                    }
                    if((Y+1)<Alto)
                    {
                        if (Areas[X][Y+1]==0)
                        {
                            AnalizarX.push(X);
                            AnalizarY.push(Y+1);
                            
                        }
                    }
                    if((X-1)>=0)
                    {
                        if (Areas[X-1][Y]==0)
                        {
                            AnalizarX.push(X-1);
                            AnalizarY.push(Y);
                            
                        }
                    }
                    if((Y-1)>=0)
                    {
                        if (Areas[X][Y-1]==0)
                        {
                            AnalizarX.push(X);
                            AnalizarY.push(Y-1);
                            
                        }
                    }
                    
                    
                    
                    //if (AnalizarX.size()==0)
                    {
                        
                        int k,l;
                        for(k=0;k<Ancho;k++)
                        {
                            for(l=0;l<Alto;l++)
                            {
                                System.out.print(Areas[k][l]);
                            }
                            System.out.println("");
                        }
                        System.out.println("------------");
                            
                            
                            
                    }
                    
                    
                    
                    
                    
                }
                
            }
        }
        
            
                
                
               
                    
    
        System.out.println(Area);
    }
    
    
    
}
