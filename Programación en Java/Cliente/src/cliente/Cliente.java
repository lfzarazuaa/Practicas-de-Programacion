/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cliente;
import java.net.*;
import java.io.*;
import java.util.Scanner;
/**
 *
 * @author LuisFernando
 */
public class Cliente {
    
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
     Socket S;
     InetSocketAddress Host;
     DataInputStream IN;
     DataOutputStream OUT;
    
     Scanner Texto;
     String Mensaje;
     Host=new InetSocketAddress("127.0.0.1",80);
     S=new Socket();
     Texto=new Scanner(System.in);
     try{
       S.connect(Host);
       IN=new DataInputStream(S.getInputStream());
       OUT=new DataOutputStream(S.getOutputStream());
       while(1==1){
           System.out.println(IN.readUTF());
           Mensaje=Texto.nextLine();
           OUT.writeUTF(Mensaje);
       }
     }
     catch(IOException e){
          System.out.println("Error de Entrada/Salida");
     }
    }
}
