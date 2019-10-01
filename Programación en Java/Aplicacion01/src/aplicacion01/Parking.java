/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package aplicacion01;

import java.util.Vector;

/**
 *
 * @author Sala1
 */
public class Parking {
    Vector <Carro> Coches;
    Parking()
    {
     Coches=new Vector();
    }
    public void addCar(Carro C)
    {
        Coches.add(C);
    }
    
    public int getNumCar()
    {
        return Coches.size();
    }
    
     public Carro getCar(int index)
    {
        if (index<getNumCar())
        {
          return Coches.get(index);
        }
        return null;
    }
}
