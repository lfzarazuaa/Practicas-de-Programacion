/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package appgui;

import java.awt.FlowLayout;
import javax.swing.JButton;
import javax.swing.JFrame;

/**
 *
 * @author LuisFernando
 */
public class Window extends JFrame{
   JButton Aceptar;
   JButton Botones[];
   FlowLayout Flujo;
   public void Init()
   {
       int i;
       Flujo= new FlowLayout();
       setLayout(Flujo);
       Aceptar=new JButton("Aceptar");
       add(Aceptar);
       Botones=new JButton[27];
       for(i=0;i<27;i++)
       {
        Botones[i]=new JButton("Boton "+ i);
        add(Botones[i]);
       }
       setSize(240,320);
       setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
       setVisible(true);
   }
}
