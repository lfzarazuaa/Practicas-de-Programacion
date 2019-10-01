
import javax.swing.JFrame;
import java.awt.BorderLayout;
import java.awt.Image;

import com.github.sarxos.webcam.Webcam;
import com.github.sarxos.webcam.WebcamPanel;
import java.awt.Dimension;
import java.awt.Graphics;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.image.BufferedImage;
import javax.swing.JButton;
import javax.swing.JPanel;
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author ivazq
 */
public class JWebCam extends JFrame implements ActionListener
{
    JButton J1;
    
    
    Webcam webcam;
    WebcamPanel panel;
    Copia ImagenCopia;
    BorderLayout Principal;
    BufferedImage Imagen;
    
    
    Graphics Grafico;
    String webcamName;
    JWebCam()
    {
        webcam=Webcam.getDefault();
        Principal=new BorderLayout();
        ImagenCopia=new Copia();
        J1=new JButton("Captura");
    }
    
    public void Init()
    {
        if (DetectDefaultWebCam())
        {
            setLayout(Principal);
            panel=new WebcamPanel(webcam);
            webcam.open(); 
           
            Imagen=webcam.getImage();
            
            ImagenCopia.setImage(Imagen);
            System.out.println(Imagen.getHeight());
            System.out.println(Imagen.getWidth());
            
            J1.addActionListener(this);
            add(panel,BorderLayout.EAST);
            add(ImagenCopia,BorderLayout.CENTER);
            add(J1,BorderLayout.SOUTH);
            setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
            setSize(640,480);
           
            setVisible(true);
        }
    }
    
    boolean DetectDefaultWebCam()
    {
        if (webcam != null) 
        { 
            webcamName=webcam.getName();
            webcam.setViewSize(new Dimension(320, 240));          
            return true; 
        }
        else
        { 
            webcamName="";
            return false;
        } 
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        System.out.println("Capturando...");
        Imagen=webcam.getImage();   
        ImagenCopia.setImage(Imagen);
        repaint();        
        }
}
