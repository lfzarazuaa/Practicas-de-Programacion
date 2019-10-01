/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ahorcadoapp;
import java.awt.event.ActionListener;
import java.awt.FlowLayout;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.WindowEvent;
import java.awt.event.WindowListener;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.Timer;

/**
 *
 * @author ivazq
 */
public class JHang extends JFrame implements ActionListener,WindowListener{
    // Del Motor de Ejecución de Ahorcado
    Ahorcado H1;

    JButton LetrasBotones[];
    JPanel General;
    JPanel Palabra;
    JPanel Botones;
    JLabel PalabraAdivinar;
    GridLayout GeneralLayout;
    FlowLayout BotonesLayout;
    Timer Tiempo;
    String Letras[]={"A","B","C","D","E","F","G","H","I","J","K","L","M","N","Ñ","O","P","Q","R","S","T","U","V","W","X","Y","Z"};
    void InitGUI()
    {
        int i;
        LetrasBotones=new JButton[27];
        BotonesLayout=new FlowLayout();
        Botones=new JPanel();
        Tiempo=new Timer(40000,this);
        Botones.setLayout(BotonesLayout);
        for(i=0;i<27;i++)
        {
            LetrasBotones[i]=new JButton(Letras[i]);
            Botones.add(LetrasBotones[i]);
            LetrasBotones[i].addActionListener(this);
        }
        
        GeneralLayout=new GridLayout(2,1);
        General=new JPanel();
        General.setLayout(GeneralLayout);
        
        try{
            PalabraAdivinar=new JLabel(H1.getGuessWord());
            General.add(PalabraAdivinar);
            General.add(Botones);
            add(General);
            
            setSize(480,320);
            setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
            setVisible(true);
        }
        catch(ExceptionHang e)
        {
            System.out.println(e);
        }
       
    }
    
    void InitAhorcado()
    {
        H1=new Ahorcado(10,5);
        try
        {
           H1.AddWord("COMPUTACION");
           H1.Init();       
        }
        catch( ExceptionHang E)
        {
            System.out.println(E.getMessage());
        }
    }
  @Override
    public void actionPerformed(ActionEvent e) {
     int i,j;
       for(i=0;i<27;i++){//Identificar la tecla presionada
          if (e.getSource().equals(LetrasBotones[i])==true)
           {
            Tiempo.start();
            LetrasBotones[i].setEnabled(false);
            try{
              H1.isChar(LetrasBotones[i].getText().charAt(0));
              PalabraAdivinar.setText(H1.getGuessWord());
             if (H1.getAttempts()==0){
              for (j=0;j<27;j++){
                LetrasBotones[j].setEnabled(false);
              }    
             }
            }
            catch(ExceptionHang H){
             System.out.println(H);
            }
           }
      }
       
      if(e.getSource()==Tiempo){
       for (j=0;j<27;j++){
                LetrasBotones[j].setEnabled(false);
           }
      }
      // throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.  
    } 

    @Override
    public void windowOpened(WindowEvent e) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void windowClosing(WindowEvent e) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void windowClosed(WindowEvent e) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void windowIconified(WindowEvent e) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void windowDeiconified(WindowEvent e) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void windowActivated(WindowEvent e) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void windowDeactivated(WindowEvent e) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}