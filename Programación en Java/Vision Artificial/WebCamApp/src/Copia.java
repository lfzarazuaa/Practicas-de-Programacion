import java.awt.Graphics;
import java.awt.Image;
import javax.swing.JPanel;

public class Copia extends JPanel{
    Image IMG;
    public void setImage(Image I){
        IMG=I;
    }
    
    @Override
    public void paintComponent(Graphics Lienzo){
        super.paintComponent(Lienzo);
        Lienzo.drawImage(IMG, 0, 0, null);
    }  
    
}
