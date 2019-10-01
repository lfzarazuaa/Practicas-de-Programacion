/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proyecto_001;
import java.util.Vector;
/**
 *
 * @author LuisFernando
 */
public class Areas_Empresa {
  Vector <Area> Areas;
  int Numero_Areas;
    Areas_Empresa()
    {
     Areas=new Vector(20,5);//Crea un vector con 20 espacios para Areas y agrega 5 espacios conforme se necesiten.
     Area Area_Gerencial,Area_Recursos_Humanos;
     Numero_Areas=2;
     Area_Gerencial=new Area("Gerencial",1,1);
     Area_Recursos_Humanos=new Area("Recursos_Humanos",2,1);
     Areas.addElement(Area_Gerencial);
     Areas.addElement(Area_Recursos_Humanos);
    }
    
    public void Agregar_Area(Area A)
    {
        Numero_Areas=Numero_Areas+1;
        Areas.add(A);
    }
    
    public int Obtener_Numero_Areas()
    {
        return Areas.size();
    }
    
     public Area Obtener_Area(int indice)
    {
        if (indice<Obtener_Numero_Areas())
        {
          return Areas.get(indice);
        }
        return null;
    }  
}
