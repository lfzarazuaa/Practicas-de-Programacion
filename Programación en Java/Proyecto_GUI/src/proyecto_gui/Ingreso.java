/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proyecto_gui;
import java.awt.BorderLayout;
import java.awt.FlowLayout;
import java.awt.GridLayout;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextField;
/**
 *
 * @author LuisFernando
 */
public class Ingreso extends JFrame{
   JTextField Caja_Usuario;
   JTextField Caja_Contrasena;
   JLabel Label_Usuario;
   JLabel Label_Contrasena;
   JLabel Titulo;
   JButton Aceptar;
   JButton Regresar;
   FlowLayout Flujo;
   BorderLayout Borde;
   JPanel Centro;
   JPanel Sur;
   GridLayout RejillaCentro,RejillaSur;
    public void Init()
    {
     Flujo= new FlowLayout();
     Borde= new BorderLayout();
     setLayout(Borde);
     Titulo=new JLabel("Ingreso al sistema");
     Label_Usuario=new JLabel("Usuario");
     Caja_Usuario=new JTextField("Ingrese Usuario");
     Label_Contrasena=new JLabel("Contrasena");
     Caja_Contrasena=new JTextField("Ingrese Contrasena");
     Aceptar=new JButton("Aceptar");
     Regresar=new JButton("Regresar");
     Centro=new JPanel();
     Sur=new JPanel();
     RejillaCentro=new GridLayout(4,1);
     Centro.setLayout(RejillaCentro);
     Centro.add(Label_Usuario);
     Centro.add(Caja_Usuario);
     Centro.add(Label_Contrasena);
     Centro.add(Caja_Contrasena);
     RejillaSur=new GridLayout(1,2);
     Sur.add(Regresar);
     Sur.add(Aceptar);
     add(Titulo,BorderLayout.NORTH);
     add(Centro,BorderLayout.CENTER);
     add(Sur,BorderLayout.SOUTH);
     setSize(240,320);
     setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
     setVisible(true);
    }
}