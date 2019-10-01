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
public class Personal {
    Vector <Persona> Empleados;
    Areas_Empresa Areas;
    Area Area_Inicializacion;
    int Numero_Empleados;
    Personal()
    {
     Numero_Empleados=1;
     Areas=new Areas_Empresa();//Se crean las áreas de la empresa con 2 áreas.
     Empleados=new Vector(20,5);//Crea un vector con 20 espacios para empleados y agrega 5 espacios conforme se necesiten.
     Area_Inicializacion=Areas.Obtener_Area(0);
     Gerente Gerente_A;
     Gerente_A=new Gerente(Numero_Empleados,"1234Gerente",Area_Inicializacion.Obtener_Nombre_del_Area());//
     Empleados.addElement(Gerente_A);
     Area_Inicializacion=Areas.Obtener_Area(1);
     Numero_Empleados=Numero_Empleados+1;
     Recursos_Humanos RH_A;
     RH_A=new Recursos_Humanos(Numero_Empleados,"1234RH",Area_Inicializacion.Obtener_Nombre_del_Area());
     Empleados.addElement(RH_A);
    }
    
    public void Agregar_Recurso_Humano(Recursos_Humanos H){
     Numero_Empleados=Numero_Empleados+1;
     H.Numero_Usuario=Numero_Empleados;
     Empleados.addElement(H);
    }
    
    public int Obtener_Numero_Empleados()
    {
        return Empleados.size();
    }
    
     public Persona Obtener_Datos(int indice)
    {
        if (indice<Obtener_Numero_Empleados())
        {
          return Empleados.get(indice);
        }
        return null;
    }
}