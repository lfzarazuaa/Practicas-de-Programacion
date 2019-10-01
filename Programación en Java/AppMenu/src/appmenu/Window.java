/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package appmenu;

import java.awt.BorderLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyEvent;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JMenu;
import javax.swing.JMenuBar;
import javax.swing.JMenuItem;
import javax.swing.JTextArea;
import javax.swing.event.MenuEvent;
import javax.swing.event.MenuListener;

/**
 *
 * @author LuisFernando
 */
public class Window extends JFrame implements MenuListener,ActionListener{
    BorderLayout Borde;
    JTextArea Texto;
    JButton Aceptar;
    JMenuBar MenuPrincipal;
    JMenu Archivo;
    JMenu Editar;
    JMenu Ver;
    JMenu Navegar;
    JMenu Source;
    JMenu Reestructurar;
    JMenu Ejecutar;
    JMenu Depurar;
    JMenu Profile;
    JMenu Team;
    JMenu Herramientas;
    JMenu Ventana;
    JMenu Ayuda;
    JMenuItem ProyectoNuevo;
    JMenuItem ArchivoNuevo;
    JMenuItem AbrirProyecto;
    JMenuItem AbrirProyectoReciente;
    JMenuItem CerrarProyecto;
    JMenuItem CerrarOtrosProyectos;
    JMenuItem CerrartodoslosProyectos;
    JMenuItem AbrirArchivo;
    JMenuItem AbrirArchivoReciente;
    JMenuItem GrupodeProyecto;
    JMenuItem PropiedadesdelProyecto;
    JMenuItem ImportarProyecto;
    JMenuItem ExportarProyecto;
    JMenuItem Guardar;
    JMenuItem GuardarComo;
    JMenuItem GuardarTodo;
    JMenuItem PrepararPagina;
    JMenuItem Imprimir;
    JMenuItem ImprimiraHTML;
    JMenuItem Salir;
    void Init()
    {
     Borde= new BorderLayout();
     Aceptar= new JButton("Aceptar");
     Aceptar.addActionListener(this);
     Texto= new JTextArea();
     setLayout(Borde);
     MenuPrincipal=new JMenuBar();
     Archivo=new JMenu("Archivo");
     ProyectoNuevo=new JMenuItem("Proyecto Nuevo");
     ArchivoNuevo=new JMenuItem("Archivo Nuevo");
     AbrirProyecto=new JMenuItem("Abrir Proyecto");
     AbrirProyectoReciente=new JMenuItem("Abrir Proyecto Reciente");
     CerrarProyecto=new JMenuItem("Cerrar Proyecto");
     CerrarOtrosProyectos=new JMenuItem("Cerrar otros Proyectos");
     CerrartodoslosProyectos=new JMenuItem("Cerrar todos los Proyectos");
     AbrirArchivo=new JMenuItem("Abrir Archivo");
     AbrirArchivoReciente=new JMenuItem("Abrir Archivo Reciente");
     GrupodeProyecto=new JMenuItem("Grupo de Proyecto");
     PropiedadesdelProyecto=new JMenuItem("Propiedades del Proyecto");
     ImportarProyecto=new JMenuItem("Importar Proyecto");
     ExportarProyecto=new JMenuItem("Exportar Proyecto");
     Guardar=new JMenuItem("Guardar");
     GuardarComo=new JMenuItem("Guardar como");
     GuardarTodo=new JMenuItem("Guardar Todo");
     PrepararPagina=new JMenuItem("Preparar Página");
     Imprimir=new JMenuItem("Imprimir");
     ImprimiraHTML=new JMenuItem("Imprimir a HTML");
     Salir=new JMenuItem("Salir");
     Editar=new JMenu("Editar");
     Ver=new JMenu("Ver");
     Navegar=new JMenu("Navegar");
     Source=new JMenu("Source");
     Reestructurar=new JMenu("Reestructurar");
     Ejecutar=new JMenu("Ejecutar");
     Depurar=new JMenu("Depurar");
     Profile=new JMenu("Profile");
     Team=new JMenu("Team");
     Herramientas=new JMenu("Herramientas");
     Ventana=new JMenu("Ventana");
     Ayuda=new JMenu("Ayuda");
     MenuPrincipal.add(Archivo);
     Archivo.add(ProyectoNuevo);
     Archivo.add(ArchivoNuevo);
     Archivo.add(AbrirProyecto);
     Archivo.add(AbrirProyectoReciente);
     Archivo.add(CerrarProyecto);
     Archivo.add(CerrarOtrosProyectos);
     Archivo.add(CerrartodoslosProyectos);
     Archivo.add(AbrirArchivo);
     Archivo.add(AbrirArchivoReciente);
     Archivo.add(GrupodeProyecto);
     Archivo.add(PropiedadesdelProyecto);
     Archivo.add(ImportarProyecto);
     Archivo.add(ExportarProyecto);
     Archivo.add(Guardar);
     Archivo.add(GuardarComo);
     Archivo.add(GuardarTodo);
     Archivo.add(PrepararPagina);
     Archivo.add(Imprimir);
     Archivo.add(ImprimiraHTML);
     Archivo.add(Salir);
     MenuPrincipal.add(Editar);
     MenuPrincipal.add(Ver);
     MenuPrincipal.add(Navegar);
     MenuPrincipal.add(Source);
     MenuPrincipal.add(Reestructurar);
     MenuPrincipal.add(Ejecutar);
     MenuPrincipal.add(Depurar);
     MenuPrincipal.add(Profile);
     MenuPrincipal.add(Team);
     MenuPrincipal.add(Herramientas);
     MenuPrincipal.add(Ventana);
     MenuPrincipal.add(Ayuda);
     add(MenuPrincipal,BorderLayout.NORTH);
     add(Texto,BorderLayout.CENTER);
     add(Aceptar,BorderLayout.SOUTH);
     Editar.setMnemonic(KeyEvent.VK_E);
     Guardar.setMnemonic(KeyEvent.VK_A);
     Navegar.addMenuListener(this);
     setSize(240,320);
     setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
     setVisible(true);
     
    }

    @Override
    public void menuSelected(MenuEvent e) {
      if(e.getSource()==Navegar){
          System.out.println("Menu Listo :)");
      }  
      //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void menuDeselected(MenuEvent e) {
        if(e.getSource()==Navegar){
          System.out.println("Menu Unseleccionado :(");
        }  
       //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void menuCanceled(MenuEvent e) {
      if(e.getSource()==Navegar){
          System.out.println("Menu :-||");
      }    
     //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        System.out.println("Hola");
       //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
