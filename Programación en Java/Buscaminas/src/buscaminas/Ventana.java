/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package buscaminas;

import java.awt.BorderLayout;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import javax.swing.JButton;
//import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JMenu;
import javax.swing.JMenuBar;
import javax.swing.JMenuItem;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JTextArea;
import javax.swing.Timer;
/**
 *
 * @author LuisFernando
 */
public class Ventana extends JFrame implements ActionListener, MouseListener{
   Campo Campo1;
   BorderLayout Borde;
   JMenuBar MenuPrincipal;
   JMenu Menu;
   JMenuItem Juego;
   JMenu Tiempo;
   JMenuItem sec60;
   JMenuItem sec120;
   JMenuItem libre;
   JButton Aceptar;
   JButton Botones[][];
   JPanel Contenedor,Abajo,Arriba;
   GridLayout Rejilla,RejillaCentro,RejillaArriba;
   JTextArea Puntacion,Tiempotxt;
   JOptionPane Informe;
   Timer Temporizador;
   int Duracion,cont;
   public void Inicializar_GUI()
   {
       int i,j,xmax,ymax;
       Borde= new BorderLayout();
       setLayout(Borde);
       Informe=new JOptionPane();
       MenuPrincipal=new JMenuBar();
       Menu=new JMenu("Nuevo");
       Juego=new JMenuItem("Juego");
       Tiempo=new JMenu("Tiempo");
       sec60=new JMenuItem("60 segundos");
       sec120=new JMenuItem("120 segundos");
       libre=new JMenuItem("Tiempo Libre");
       Temporizador=new Timer(100,this);
       MenuPrincipal.add(Menu);
       Menu.add(Juego);
       Menu.add(Tiempo);
       Tiempo.add(sec60);
       Tiempo.add(sec120);
       Tiempo.add(libre);
       Juego.addActionListener(this);
       sec60.addActionListener(this);
       sec120.addActionListener(this);
       libre.addActionListener(this);
       Contenedor=new JPanel();
       Rejilla=new GridLayout(2,1);
       Contenedor.setLayout(Rejilla);
       Arriba=new JPanel();
       RejillaArriba=new GridLayout(1,2);
       Puntacion=new JTextArea("0000");
       Tiempotxt=new JTextArea("00:00");
       Arriba.setLayout(RejillaArriba);
       Arriba.add(Puntacion);
       Arriba.add(Tiempotxt);
       Contenedor.add(Arriba);
       Abajo=new JPanel();
       RejillaCentro=new GridLayout(6,7);
       Abajo.setLayout(RejillaCentro);
       Contenedor.add(Abajo);
       xmax=Campo1.getXmax();
       ymax=Campo1.getYmax();
       Botones=new JButton[xmax][ymax];
       for (j=0;j<ymax;j++){
       for(i=0;i<xmax;i++){
        //Botones[i]=new JButton("Boton "+ i);
        Botones[i][j]=new JButton();
        Abajo.add(Botones[i][j]);
        Botones[i][j].addActionListener(this);
        }
       }
       add(MenuPrincipal,BorderLayout.NORTH);
       add(Contenedor,BorderLayout.CENTER);
       setSize(500,500);
       setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
       setVisible(true);
       Duracion=60;
       Tiempotxt.setText("01:00");
       //Imprimir_Solucion();
   }
   public void Inicializar_Juego(){
    Campo1=new Campo();
    Campo1.Inicializar_Bombas(15);
    Campo1.Cargar_Numero();
   }
   public void Nuevo_Juego(){
    String Texto;
    Desbloquear_Tablero();
    Inicializar_Juego();
    //Imprimir_Solucion();
    Texto=""+Campo1.getCasillas_marcadas();
    Puntacion.setText(Texto);
   }
   public void Modificar_Boton(int CoordenadaX,int CoordenadaY,String Texto){
    Botones[CoordenadaX][CoordenadaY].setText(Texto);
   }
   
   public void Imprimir_Solucion(){
      int i,j,xmax,ymax,bombas_cercanas;
      xmax=Campo1.getXmax();
      ymax=Campo1.getYmax();
      String Texto;
      for(j=0;j<ymax;j++){
      for(i=0;i<xmax;i++){
        bombas_cercanas=Campo1.Imprimir_Bombas(i,j);
        if (bombas_cercanas<9){
        Texto=""+bombas_cercanas;}
        else{
        Texto="*";}
        this.Modificar_Boton(i, j, Texto);
       }
      }
    }
    public void Bloquear_Tablero(){
     int i,j,xmax,ymax;
      xmax=Campo1.getXmax();
      ymax=Campo1.getYmax();
      for(j=0;j<ymax;j++){
      for(i=0;i<xmax;i++){
        Botones[i][j].setEnabled(false);
       }
      }
    }
    public void Desbloquear_Tablero(){
     int i,j,xmax,ymax;
      xmax=Campo1.getXmax();
      ymax=Campo1.getYmax();
      for(j=0;j<ymax;j++){
      for(i=0;i<xmax;i++){
        Botones[i][j].setEnabled(true);
        Botones[i][j].setText("");
       }
      }
    }
    public void Perder_Juego(){
     Parar_Temporizador();
     JOptionPane.showMessageDialog(null,"Juego Perdido");
     Imprimir_Solucion();
     Bloquear_Tablero();
     Campo1.setCasillas_marcadas(0);
    }
    public void Inicializar_Temporizador(){
      Temporizador.start();
      cont=0;
    }
    public void Continuar_Temporizador(){
      if (Campo1.getCasillas_marcadas()>0){
          Temporizador.start();}
      else{
       Tiempotxt.setText(Regresar_Tiempo(0));
      }
    }
    public void Parar_Temporizador(){
      Temporizador.stop();
    }
    public void Mostrar_Tiempo(){
        float Segundos;
        String Texto;
        if (Duracion>0){
         cont=cont+1;
         Segundos=cont/10;
         Texto=Regresar_Tiempo(Segundos);
         Tiempotxt.setText(Texto);
         if(cont==Duracion*10){
           cont=0;
           System.out.println("Tiempo Agotado");
           Perder_Juego();
         }  
        }
        else{
          System.out.println("Tiempo libre");
          Parar_Temporizador();
        }
    }
    public String Regresar_Tiempo(float Segundos){
     float Segundos_Faltantes,minutos=0,segundos;
     String Texto;
     Segundos_Faltantes=Duracion-Segundos;
      while(Segundos_Faltantes>=60){
       Segundos_Faltantes=Segundos_Faltantes-60;
       minutos=minutos+1;}
      segundos=Segundos_Faltantes;
      if (segundos>=10){
      Texto="0"+(int)minutos+":"+(int)segundos;}
      else{
      Texto="0"+(int)minutos+":0"+(int)segundos;}
      return Texto;
    }
    @Override
    public void actionPerformed(ActionEvent e) {
        //System.out.println("Tecla presionada");
       int i,j,xmax,ymax,bombas_cercanas;
        if (e.getSource()==Juego){
            //System.out.println("Nuevo Juego");
            Nuevo_Juego();
            Parar_Temporizador();
        }
        if (e.getSource().equals(sec60)==true){
            //System.out.println("60 segundos");
            Duracion=60;
            Continuar_Temporizador();
        }
        if (e.getSource().equals(sec120)==true){
            //System.out.println("120 segundos");
            Duracion=120;
            Continuar_Temporizador();
        }
        if (e.getSource().equals(libre)==true){
            //System.out.println("libre");
            Duracion=-1;
            Tiempotxt.setText("--:--");
        }
        if(e.getSource()==Temporizador){
           Mostrar_Tiempo();
        }
       xmax=Campo1.getXmax();
       ymax=Campo1.getYmax();
       String Texto;
       for(j=0;j<ymax;j++){
       for(i=0;i<xmax;i++){//Identificar la tecla presionada
          if (e.getSource().equals(Botones[i][j])==true)
           {
            bombas_cercanas=Campo1.Imprimir_Bombas(i,j);
            if (bombas_cercanas<9){//No es bomba.
            Texto=""+bombas_cercanas;
            this.Modificar_Boton(i,j,Texto);
            Botones[i][j].setEnabled(false);
            Campo1.Incrementar_Casilla_Marcada();
            Texto=""+Campo1.getCasillas_marcadas();
            Puntacion.setText(Texto);
            if (Campo1.getCasillas_marcadas()<2){
              Inicializar_Temporizador();
            }
            if (Campo1.Determinar_Juego_Ganado()){
               //default title and icon
               Parar_Temporizador();
               Campo1.setCasillas_marcadas(0);
               JOptionPane.showMessageDialog(null,"Juego Ganado");
               Imprimir_Solucion();
               Bloquear_Tablero();
            }
            //System.out.println("Tecla "+i+","+j+" correcta");
            }
            else{//Es bomba
             Texto="*";
             this.Modificar_Boton(i,j,Texto);
             Perder_Juego();
            //System.out.println("Tecla "+i+","+j+" es bomba.");
            }
           }
       }
      }
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void mouseClicked(MouseEvent e) {
        System.out.println("Click Izquierdo");
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void mousePressed(MouseEvent e) {
       System.out.println("Click Izquierdo"); 
       //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void mouseReleased(MouseEvent e) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void mouseEntered(MouseEvent e) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void mouseExited(MouseEvent e) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}