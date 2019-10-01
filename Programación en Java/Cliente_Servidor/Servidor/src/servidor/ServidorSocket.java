/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servidor;


import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.net.InetSocketAddress;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.Scanner;

/**
 *
 * @author ivazq
 */
public class ServidorSocket {
    ServerSocket Escucha;
    Socket Aceptar;
    InputStream In;
    OutputStream Out;
    Scanner Teclado;
    
    void InitSocket() throws IOException
    {
        String S;
        String c;
        Teclado=new Scanner(System.in);
        byte cbuf[]; 
        
        Escucha=new ServerSocket(127);
        
        Aceptar=Escucha.accept();
        System.out.println("Conexion Aceptada" + Aceptar.getPort());
        In=Aceptar.getInputStream();
        Out=Aceptar.getOutputStream();
        do{
            cbuf=new byte[1024];
            In.read(cbuf);
            S=new String(cbuf);
            System.out.println("Cliente:" +S);
            c=Teclado.nextLine();
            Out.write(c.getBytes());
            
        }while(S.equalsIgnoreCase("Salir")!=true);
    }
    
    
}
