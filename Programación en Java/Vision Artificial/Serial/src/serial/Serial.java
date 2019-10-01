/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package serial;

import gnu.io.CommPortIdentifier;
import gnu.io.NoSuchPortException;
import gnu.io.PortInUseException;
import gnu.io.SerialPort;
import gnu.io.UnsupportedCommOperationException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
//import static java.lang.Thread.sleep;
import java.util.Enumeration;

/**
 *
 * @author ivazq
 */
public class Serial {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws PortInUseException, UnsupportedCommOperationException, IOException, InterruptedException {
        // TODO code application logic here
        Enumeration puertos_libres =null;
        CommPortIdentifier port=null;
        SerialPort puerto_ser = null;
        OutputStream out = null;
        InputStream in = null;

        //Enumera los puertos
        
        puertos_libres = CommPortIdentifier.getPortIdentifiers();
        while (puertos_libres.hasMoreElements())
        {
            port=(CommPortIdentifier) puertos_libres.nextElement();
            System.out.println("Nombre:"+port.getName());
        }
        
        puerto_ser= (SerialPort) port.open("COM1", 2);
        System.out.println("Abriendo Puerto");
 
        puerto_ser.setSerialPortParams(9600, SerialPort.DATABITS_8, SerialPort.STOPBITS_1, SerialPort.PARITY_NONE);
        System.out.println("Configurado");
        out = puerto_ser.getOutputStream();//salida de java
        in = puerto_ser.getInputStream(); // entrada 

        boolean flag=true;
        int A;
        System.out.println("Leyendo");
        byte []b;
        b=new byte[1];
        while(flag)
        {
            //System.out.println(""+b);
            out.write(in.read());
        }
        puerto_ser.close();
    }
}
