/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package appgui;
import java.awt.BorderLayout;
import java.awt.FlowLayout;
import javax.swing.JButton;
import javax.swing.JFrame;
/**
 *
 * @author LuisFernando
 */
public class Window3 extends JFrame{
   JButton Norte;
   JButton Sur;
   JButton Este;
   JButton Oeste;
   JButton Centro;
   FlowLayout Flujo;
   BorderLayout Borde;
   public void Init()
   {
       int i;
       Flujo= new FlowLayout();
       Borde= new BorderLayout();
       setLayout(Borde);
       Norte=new JButton("Norte");
       Sur=new JButton("Sur");
       Este=new JButton("Este");
       Oeste=new JButton("Oeste");
       Centro=new JButton("Centro");
       add(Norte,BorderLayout.NORTH);
       add(Sur,BorderLayout.SOUTH);
       add(Este,BorderLayout.EAST);
       add(Oeste,BorderLayout.WEST);
       add(Centro,BorderLayout.CENTER);
       setSize(240,320);
       setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
       setVisible(true);
   }   
}
