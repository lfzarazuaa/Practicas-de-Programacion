/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servidorprogavan;

import java.awt.FlowLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JTextField;

/**
 *
 * @author ivazq
 */
public class ServidorGUI extends JFrame implements ActionListener,UserConnectedListener{

    boolean ServidorIniciadoFlag=false;
    ServidorEngine Servidor;
    JTextField Port;
    JLabel Etiqueta;
    JButton Iniciar;
    FlowLayout Flujo;
    
    public void Init()
    {
        Port=new JTextField();
        Port.setColumns(4);
        Etiqueta=new JLabel("Número de Puerto de Escucha");
        Iniciar=new JButton("Iniciar");
        Flujo=new FlowLayout();
        
        setLayout(Flujo);
        
        add(Etiqueta);
        add(Port);
        add(Iniciar);
        
        Iniciar.addActionListener(this);
        
        setSize(250,150);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setResizable(false);
        setVisible(true);
    }
    @Override
    public void UserConectedEvent(UserEngine UE) {
        UserChatGUI Chat=new UserChatGUI();
        Chat.Init(UE);
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        if (e.getSource()==Iniciar)
        {
            if (ServidorIniciadoFlag==false)
            {
                Iniciar.setText("Escuchando");
                Servidor=new ServidorEngine(80);
                Servidor.setUseConnectedListener(this);
                ServidorIniciadoFlag=true;
                Servidor.start();
            }
            else
            {
                 Iniciar.setText("Iniciar");
                ServidorIniciadoFlag=false;
                Servidor.setDetenerServidor(true);
            }
            
        }
    }
    
    
    
}
