/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package appgui;

import java.awt.BorderLayout;
import java.awt.FlowLayout;
import java.awt.GridLayout;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JPanel;
/**
 *
 * @author LuisFernando
 */
public class Window4 extends JFrame{
   JButton Norte;
   JButton Sur;
   JButton Este01;
   JButton Este02;
   JButton Este03;
   JButton Este04;
   JButton Este05;
   JButton Este06;
   JButton Este07;
   JButton Este08;
   JButton Este09;
   JButton Centro;
   JPanel Este;
   FlowLayout Flujo;
   BorderLayout Borde;
   GridLayout RejillaEste;
   public void Init()
   {
       Flujo= new FlowLayout();
       Borde= new BorderLayout();
       setLayout(Borde);
       Norte=new JButton("Norte");
       Sur=new JButton("Sur");
       Centro=new JButton("Centro");
       Este01=new JButton("Este01");
       Este02=new JButton("Este02");
       Este03=new JButton("Este03");
       Este04=new JButton("Este04");
       Este05=new JButton("Este05");
       Este06=new JButton("Este06");
       Este07=new JButton("Este07");
       Este08=new JButton("Este08");
       Este09=new JButton("Este09");
       RejillaEste=new GridLayout(9,1);
       Este=new JPanel();
       Este.setLayout(RejillaEste);
       Este.add(Este01);
       Este.add(Este02);
       Este.add(Este03);
       Este.add(Este04);
       Este.add(Este05);
       Este.add(Este06);
       Este.add(Este07);
       Este.add(Este08);
       Este.add(Este09);
       add(Norte,BorderLayout.NORTH);
       add(Sur,BorderLayout.SOUTH);
       add(Este,BorderLayout.EAST);
       add(Centro,BorderLayout.CENTER);
       setSize(240,320);
       setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
       setVisible(true);
   }     
}