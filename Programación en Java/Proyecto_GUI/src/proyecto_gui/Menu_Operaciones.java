/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proyecto_gui;

import java.awt.BorderLayout;
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
public class Menu_Operaciones extends JFrame implements MenuListener{
    BorderLayout Borde;
    JTextArea Texto;
    JButton Aceptar;
    JMenuBar MenuPrincipal;
    JMenu Matematicas;
    JMenuItem Suma;
    JMenuItem Resta;
    JMenuItem Multiplicacion;
    JMenuItem Division;
    JMenuItem NumerosComplejos;
    JMenuItem Matriz;
    JMenuItem Sistema2Incognitas;
    JMenuItem Sistema3Incognitas;
    JMenu Fisica;
    JMenuItem SumaVectores;
    JMenuItem ProductoPunto;
    JMenuItem ProductoCruz;
    JMenuItem TiroParabolico;
    JMenuItem CalculodePeso;
    JMenu Circuitos;
    JMenuItem LeydeOhm;
    JMenuItem ResistenciaLed;
    JMenuItem ConversorDeltaEstrella;
    JMenuItem FiltroPasaBajas;
    JMenuItem FiltroPasaAltas;
    JMenu Ayuda;
    JMenu Salir;
    void Init()
    {
     Borde= new BorderLayout();
     Aceptar= new JButton("Aceptar");
     Texto= new JTextArea();
     setLayout(Borde);
     MenuPrincipal=new JMenuBar();
     Matematicas=new JMenu("Matemáticas");
     Suma=new JMenuItem("Suma");
     Resta=new JMenuItem("Resta");
     Multiplicacion=new JMenuItem("Multiplicacion");
     Division=new JMenuItem("División");
     NumerosComplejos=new JMenuItem("Numeros Complejos");
     Matriz=new JMenuItem("Matiz");
     Sistema2Incognitas=new JMenuItem("Sistema de Ecuaciones de 2 Incógnitas");
     Sistema3Incognitas=new JMenuItem("Sistema de Ecuaciones de 3 Incógnitas");
     Fisica=new JMenu("Física");
     SumaVectores=new JMenuItem("Suma de Vectores");
     ProductoPunto=new JMenuItem("Producto Punto");
     ProductoCruz=new JMenuItem("Producto Cruz");
     TiroParabolico=new JMenuItem("Tiro Parabólico");
     CalculodePeso=new JMenuItem("Cálculo de Peso");
     Circuitos=new JMenu("Circuitos");
     LeydeOhm=new JMenu("Ley de Ohm");
     ResistenciaLed=new JMenu("Resistencia del Led");
     ConversorDeltaEstrella=new JMenu("Conversor Delta-Estrella");
     FiltroPasaBajas=new JMenu("Filtro Pasa Bajas");
     FiltroPasaAltas=new JMenu("Filtro Pasa Altas");
     Ayuda=new JMenu("Ayuda");
     Salir=new JMenu("Salir");
     MenuPrincipal.add(Matematicas);
     Matematicas.add(ProyectoNuevo);
     Matematicas.add(ArchivoNuevo);
     Matematicas.add(AbrirProyecto);
     Matematicas.add(AbrirProyectoReciente);
     Matematicas.add(CerrarProyecto);
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
}
