/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cliente;

import java.io.IOException;
import java.util.Scanner;

/**
 *
 * @author ivazq
 */
public class Cliente {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws IOException {
        // TODO code application logic here
        ClienteSocket C;
        Scanner Teclado;
        Teclado=new Scanner(System.in);
        C=new ClienteSocket();
        String S;
        
        System.out.println(""+C.Conectar());

        do
        {
        S=Teclado.nextLine();
        C.SendData(S);
        System.out.println("Servidor:"+C.ReciveData());
        }while (S.equalsIgnoreCase("Salir")!=true);     
    }
}