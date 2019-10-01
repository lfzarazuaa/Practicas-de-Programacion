/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clientprogava;

import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.InetSocketAddress;
import java.net.Socket;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.JTextField;

/**
 *
 * @author ivazq
 */
public class ClienteGUI  extends JFrame implements ActionListener,UserRecibeListener{
    UserEngine User;
    JTextArea Mensajes;
    JTextField Mensaje;
    JLabel Etiqueta;
    JButton Enviar;
    JScrollPane MensajesBar;
    GridLayout Rejilla;
    
    Socket Conexion;
    InetSocketAddress IP;
    
    void Conectar()
    {
         Conexion=new Socket();
         IP=new InetSocketAddress("10.104.103.130",80);
          try
        {
            Conexion.connect(IP);
            User=new UserEngine(Conexion);
            Init(User);
        }
        catch(IOException e)
        {
            
        }
        
    }
    
    void Init(UserEngine User)
    {
        this.User=User;
        Mensajes=new JTextArea();
        Mensaje=new JTextField();
        Enviar=new JButton("Enviar");
        Rejilla=new GridLayout(4,1);
        Etiqueta=new JLabel("Mensajes");
        MensajesBar=new JScrollPane(Mensajes);
        
        setLayout(Rejilla);
        add(Etiqueta);
        add(MensajesBar);
        add(Mensaje);
        add(Enviar);
        
        Enviar.addActionListener(this);
        
        setSize(240,320);
        setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        User.setUserRecibeListener(this);
        User.start();
        setVisible(true);   
    }

    @Override
    public void UserRecibeEvent(UserEngine UE, String S) {
        Mensajes.append("Servidor:"+S+"\n");
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        User.sendMessage(Mensaje.getText());
        Mensajes.append("Cliente:" + Mensaje.getText()+"\n");
        Mensaje.setText("");
    }
}
