/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cliente;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.net.SocketAddress;

/**
 *
 * @author ivazq
 */
public class ClienteSocket {
    Socket Conexion;
    InetSocketAddress IP;
    InputStream In;
    OutputStream Out;
   
    ClienteSocket()
    {
        Conexion=new Socket();
        //IP=new InetSocketAddress("127.0.0.1",127);
        IP=new InetSocketAddress("10.104.98.118",127);
    }
    boolean Conectar() throws IOException
    {
        try
        {
            Conexion.connect(IP);
            In=Conexion.getInputStream();
            Out=Conexion.getOutputStream();
            return true;
        }
        catch(IOException e)
        {
            return false;
        }
    }
    void SendData(String s) throws IOException
    {
        Out.write(s.getBytes());  
    }
    String ReciveData() throws IOException
    {
     String s;
     byte b[];
     b=new byte[1024];
     In.read(b);
     s=new String(b);
     return s;
    }
}