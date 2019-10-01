

import java.awt.Color;
import java.awt.FlowLayout;
import java.awt.Image;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.image.BufferedImage;
import java.awt.image.ColorModel;
import java.io.IOException;
import java.util.Vector;
import javax.imageio.ImageIO;
import javax.swing.ImageIcon;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JButton;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author SDK
 */
public class Window extends JFrame implements ActionListener{
    JPanel Origen;
    JPanel Destino;
    ImageIcon Imagen;
    BufferedImage ImagenOrigen;
    FlowLayout Distribucion;
    JLabel Car;
    JButton change;
    JButton change1;
    JButton change2;
    JButton Areas;
    Color MONO;
    Color GRIS;
    Color RGB;
    
    Window() throws IOException
    {
        
        Origen=new JPanel();
        Destino=new JPanel();
        Imagen=new ImageIcon();
        Distribucion=new FlowLayout();
        ImagenOrigen=ImageIO.read(this.getClass().getResource("RC8.png"));
        Imagen.setImage(ImagenOrigen);
        Car=new JLabel(Imagen);
        change=new JButton("Escala de Gris");
        change1=new JButton("Monocromatico");
        change2=new JButton("Bordes");
        Areas=new JButton("Areas");
        
    }
    
    void Init()
    {
        Origen.add(Car);
        setLayout(Distribucion);
        add(Origen);
        add(Destino);
        add(change);
        add(change1);
        add(change2);
        add(Areas);
        change.addActionListener(this);
        change1.addActionListener(this);
        change2.addActionListener(this);
        Areas.addActionListener(this);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setSize(640,480);
        setVisible(true);
        
        
    }

    @Override
    public void actionPerformed(ActionEvent ae) {
        
    
    if (ae.getSource().equals(change))
    {
        int x,y;
        int gris;

        for(x=0;x<ImagenOrigen.getWidth();x++)
            for(y=0;y<ImagenOrigen.getHeight();y++)
            {
                RGB=new Color(ImagenOrigen.getRGB(x,y));
                gris=(int)((RGB.getRed()*0.11)+(RGB.getGreen()*0.59)+(RGB.getBlue()*0.30));
                GRIS=new Color(gris,gris,gris);
                ImagenOrigen.setRGB(x, y, GRIS.getRGB());
                Imagen.setImage(ImagenOrigen);
                Car.setIcon(Imagen);
                Car.repaint(); 
            }
        
    }
    
    if(ae.getSource().equals(change1))
    {
         int x,y;
         int Mono;
        for(x=0;x<ImagenOrigen.getWidth();x++)
            for(y=0;y<ImagenOrigen.getHeight();y++)
            {
               
                Mono=ImagenOrigen.getRGB(x, y);
                MONO=new Color(Mono);
                if (MONO.getRed()>180)
                {
                    ImagenOrigen.setRGB(x, y, Color.WHITE.getRGB());
                }
                else
                {
                    ImagenOrigen.setRGB(x, y,Color.BLACK.getRGB());
                }
                   
                
                Imagen.setImage(ImagenOrigen);
                Car.setIcon(Imagen);
                Car.repaint(); 
            }
        
    }
    
    if (ae.getSource().equals(change2))
    {
        int ImgDestino[][];
        int x,y,j,i;
        int SobelMaskH[][]={{-1,-2,-1},{0,0,0},{1,2,1}};
        int SobelMaskV[][]={{-1,0,1},{-2,0,2},{-1,0,1}};
        
        int AV,BV,CV,DV,EV,FV,GV,HV,IV;
        int AH,BH,CH,DH,EH,FH,GH,HH,IH;
        Color SobelPixel[][];
        SobelPixel=new Color[3][3];
        ImgDestino=new int[ImagenOrigen.getWidth()][ImagenOrigen.getHeight()];
        for(i=1;i<ImagenOrigen.getWidth()-1;i++)
            for(j=1;j<ImagenOrigen.getHeight()-1;j++)
            {
                SobelPixel[0][0]=new Color(ImagenOrigen.getRGB(i-1, j-1));
                SobelPixel[0][1]=new Color(ImagenOrigen.getRGB(i, j-1));
                SobelPixel[0][2]=new Color(ImagenOrigen.getRGB(i+1, j-1));
                SobelPixel[2][0]=new Color(ImagenOrigen.getRGB(i-1, j+1));
                SobelPixel[2][1]=new Color(ImagenOrigen.getRGB(i, j+1));
                SobelPixel[2][2]=new Color(ImagenOrigen.getRGB(i+1, j+1));
                AH=(SobelPixel[0][0]).getRed()*SobelMaskH[0][0];
                BH=(SobelPixel[0][1]).getRed()*SobelMaskH[0][1];
                CH=(SobelPixel[0][2]).getRed()*SobelMaskH[0][2];
                GH=(SobelPixel[2][0]).getRed()*SobelMaskH[2][0];
                HH=(SobelPixel[2][1]).getRed()*SobelMaskH[2][1];
                IH=(SobelPixel[2][2]).getRed()*SobelMaskH[2][2];
                AV=(SobelPixel[0][0]).getRed()*SobelMaskV[0][0];
                BV=(SobelPixel[0][1]).getRed()*SobelMaskV[0][1];
                CV=(SobelPixel[0][2]).getRed()*SobelMaskV[0][2];
                GV=(SobelPixel[2][0]).getRed()*SobelMaskV[2][0];
                HV=(SobelPixel[2][1]).getRed()*SobelMaskV[2][1];
                IV=(SobelPixel[2][2]).getRed()*SobelMaskV[2][2];
                ImgDestino[i][j]=Math.abs(AH+BH+CH+GH+HH+IH)+Math.abs(AV+BV+CV+GV+HV+IV);
                if (ImgDestino[i][j]>255)
                {
                    ImgDestino[i][j]=255;
                }
            }
        Color Border;
        for(i=1;i<ImagenOrigen.getWidth()-1;i++)
            for(j=1;j<ImagenOrigen.getHeight()-1;j++)
            {   
                Border=new Color(ImgDestino[i][j],ImgDestino[i][j],ImgDestino[i][j]);
                ImagenOrigen.setRGB(i,j,Border.getRGB());
            }
        Imagen.setImage(ImagenOrigen);
        Car.setIcon(Imagen);
        Car.repaint(); 
        
    }
}
    
    
}
