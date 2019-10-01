/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ahorcadoapp;

import java.util.Scanner;

/**
 *
 * @author ivazq
 */
public class AhorcadoApp {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        
        JHang JH1;
        JH1=new JHang();
        JH1.InitAhorcado();
        JH1.InitGUI();
        Scanner Teclado;
        Teclado=new Scanner(System.in);
        
        Ahorcado H1;
        H1=new Ahorcado(10,5);
        try
        {
           H1.AddWord("computacion");
           H1.Init();
           while((H1.getAttempts()!=0) && (H1.isGuess()!=true))
           {
               System.out.println(H1.getGuessWord());
               char Caracter=(Teclado.next()).charAt(0);
               H1.isChar(Caracter);
               System.out.println(H1.getGuessWord()+ " " + H1.getAttempts());
           }
            
        }
        catch( ExceptionHang E)
        {
            System.out.println(E.getMessage());
        }
        
      
        
    }
    
}
