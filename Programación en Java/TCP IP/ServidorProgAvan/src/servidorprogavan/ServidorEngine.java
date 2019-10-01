/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servidorprogavan;

import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;

/**
 *
 * @author ivazq
 */
public class ServidorEngine extends Thread {
    
    
    int Port;
    ServerSocket Servidor;
    Socket Aceptar;
    boolean DetenerFlag=true;
    UserEngine User;
    UserConnectedListener UserConnected=null;
    
    ServidorEngine(int Port)
    {       
        this.Port=Port;
    }
    
    void setDetenerServidor(boolean f)
    {
        DetenerFlag=f;
        try
        {
            Servidor.close();
        }
        catch(IOException e)
        {
            
        }
    }
    
    void setUseConnectedListener(UserConnectedListener UserConnected)
    {
        this.UserConnected=UserConnected;
    }
    
    @Override
    public void run()
    {
        try
        {
            Servidor=new ServerSocket(Port);
            DetenerFlag=false;
            while(DetenerFlag==false)
            {
                Socket S=Servidor.accept();
                if (UserConnected!=null)
                {
                    UserEngine UE=new UserEngine(S);
                    UserConnected.UserConectedEvent(UE);
                }
                
            }
            Servidor.close();            
        }
        catch(IOException e)
        {
                    
        }
    }
    
    
    
}
