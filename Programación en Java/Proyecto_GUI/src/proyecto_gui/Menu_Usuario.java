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
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextField;

/**
 *
 * @author LuisFernando
 */
public class Menu_Usuario extends JFrame{
   JLabel Label_Titulo;
   JLabel Label_Nombre;
   JTextField Caja_Nombre;
   JLabel Label_Apellido_Paterno;
   JTextField Caja_Apellido_Paterno;
   JLabel Label_Apellido_Materno;
   JTextField Caja_Apellido_Materno;
   JLabel Label_Area;
   JTextField Caja_Area;
   JLabel Label_Contrasena;
   JTextField Caja_Contrasena;
   JLabel Label_Salario;
   JTextField Caja_Salario;
   JLabel Label_Antiguedad;
   JTextField Caja_Antiguedad;
   JLabel Label_Edad;
   JTextField Caja_Edad;
   JLabel Label_Numero_Usuario;
   JTextField Caja_Numero_Usuario;
   JLabel Label_Tipo_de_Empleado;
   JComboBox Combo_Tipo_de_Empleado;
   JLabel Label_Opciones;
   JComboBox Combo_Opciones;
   JButton Salir,Limpiar,Aceptar,Guardar;
   FlowLayout Flujo;
   BorderLayout Borde;
   JPanel Este,Oeste,Sur;
   GridLayout RejillaOeste,RejillaEste,RejillaSur;
    public void Init()
    {
     Flujo= new FlowLayout();
     Borde= new BorderLayout();
     setLayout(Borde);
     Label_Titulo=new JLabel("Bienvenido");
     Label_Nombre=new JLabel("Nombre");
     Caja_Nombre=new JTextField("Ingrese Nombre");
     Label_Apellido_Paterno=new JLabel("Apellido Paterno");
     Caja_Apellido_Paterno=new JTextField("Ingrese Apellido Paterno");
     Label_Apellido_Materno=new JLabel("Apellido Materno");
     Caja_Apellido_Materno=new JTextField("Ingrese Apellido Materno");
     Label_Area=new JLabel("Area");
     Caja_Area=new JTextField("Ingrese Area");
     Label_Contrasena=new JLabel("Contrasena");
     Caja_Contrasena=new JTextField("Ingrese Contrasena");
     Label_Salario=new JLabel("Salario");
     Caja_Salario=new JTextField("Ingrese Salario");
     Label_Antiguedad=new JLabel("Antiguedad");
     Caja_Antiguedad=new JTextField("Ingrese Antiguedad");
     Label_Edad=new JLabel("Edad");
     Caja_Edad=new JTextField("Ingrese Edad");
     Label_Numero_Usuario=new JLabel("Numero Usuario");
     Caja_Numero_Usuario=new JTextField("Ingrese Numero Usuario");
     Label_Tipo_de_Empleado=new JLabel("Tipo de Empleado");
     Combo_Tipo_de_Empleado=new JComboBox();
     Label_Opciones=new JLabel("Opciones");
     Combo_Opciones=new JComboBox();
     Aceptar=new JButton("Aceptar");
     Limpiar=new JButton("Limpiar");
     Guardar=new JButton("Guardar");
     Salir=new JButton("Salir");
     Este=new JPanel();
     Oeste=new JPanel();
     Sur=new JPanel();
     RejillaOeste=new GridLayout(18,1);
     RejillaEste=new GridLayout(2,1);
     RejillaSur=new GridLayout(1,4);
     Oeste.setLayout(RejillaOeste);
     Este.setLayout(RejillaEste);
     Sur.setLayout(RejillaSur);
     Oeste.add(Label_Nombre);
     Oeste.add(Caja_Nombre);
     Oeste.add(Label_Apellido_Paterno);
     Oeste.add(Caja_Apellido_Paterno);
     Oeste.add(Label_Apellido_Materno);
     Oeste.add(Caja_Apellido_Materno);
     Oeste.add(Label_Area);
     Oeste.add(Caja_Area);
     Oeste.add(Label_Contrasena);
     Oeste.add(Caja_Contrasena);
     Oeste.add(Label_Salario);
     Oeste.add(Caja_Salario);
     Oeste.add(Label_Antiguedad);
     Oeste.add(Caja_Antiguedad);
     Oeste.add(Label_Edad);
     Oeste.add(Caja_Edad);
     Oeste.add(Label_Numero_Usuario);
     Oeste.add(Caja_Numero_Usuario);
     Oeste.add(Label_Tipo_de_Empleado);
     Oeste.add(Combo_Tipo_de_Empleado);
     //
     Este.add(Label_Opciones);
     Este.add(Combo_Opciones);
     Sur.add(Salir);
     Sur.add(Limpiar);
     Sur.add(Aceptar);
     Sur.add(Guardar);
     add(Label_Titulo,BorderLayout.NORTH);
     add(Oeste,BorderLayout.CENTER);
     add(Este,BorderLayout.EAST);
     add(Sur,BorderLayout.SOUTH);
     setSize(240,320);
     setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
     setVisible(true);
    }
}

