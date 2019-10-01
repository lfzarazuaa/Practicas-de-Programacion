/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proyecto_app;
import  java.util.ArrayList;
/**
 *
 * @author LuisFernando
 */
public class Clase_Magnitudes_Fisicas {
    public ArrayList <Clase_Magnitud_Fisica> Magnitudes_Fisicas;
    int Numero_de_Magnitudes;

     public Clase_Magnitudes_Fisicas() {
        Magnitudes_Fisicas=new ArrayList(15);//Crea un arreglo con 15 espacios.
        Numero_de_Magnitudes=0;
        Inicializar_Conversor();
     }
     
     public void addItem(Clase_Magnitud_Fisica Magnitud)
     {
      Magnitudes_Fisicas.add(Magnitud);
      Numero_de_Magnitudes=Magnitudes_Fisicas.size();
     }
     public void removeAllItems(){
      Magnitudes_Fisicas.clear();
      Numero_de_Magnitudes=Magnitudes_Fisicas.size();
     }
     public int getSize()
     {
      return Magnitudes_Fisicas.size();
     }
     public Clase_Magnitud_Fisica getItem(int indice)
     {
        if (indice<getSize())
        {
          return Magnitudes_Fisicas.get(indice);
        }
        return null;
     }

    private void Inicializar_Conversor() {
      double pi=3.14159265358979323846,lb=0.4535924,in=2.54;
      Clase_Magnitud_Fisica Angulo=new Clase_Magnitud_Fisica("Ángulo");
      Angulo.Agregar_Unidad("Grado","°",1);
      Angulo.Agregar_Unidad("Radián","rad",180/pi);
      Angulo.Agregar_Unidad("Grado Centesimal","grd",0.9);
      Angulo.Agregar_Unidad("Minuto","'",(double)1/60);
      Angulo.Agregar_Unidad("Segundo","''",(double)1/3600);
      Angulo.Agregar_Unidad("Sign"," sign",30);
      Angulo.Agregar_Unidad("Mil"," mil",(double)9/160);
      Angulo.Agregar_Unidad("Revolución","rev",360);
      Angulo.Agregar_Unidad("Circunferencia","cir",360);
      Angulo.Agregar_Unidad("Turn","turn",360);
      Angulo.Agregar_Unidad("Cuadrante","quad",90);
      Angulo.Agregar_Unidad("Ángulo Recto","|_",90);
      Angulo.Agregar_Unidad("Revolución","rev",(double)1/360);
      Angulo.Agregar_Unidad("Sextante","/_",60);
      Angulo.Agregar_Unidad("Octante","oct",45);
      Clase_Magnitud_Fisica Area=new Clase_Magnitud_Fisica("Área");
      //Area.Agregar_Unidad("","",);
      Area.Agregar_Unidad("metro²","m²",1);
      Area.Agregar_Unidad("kilometro²","km²",1e6);
      Area.Agregar_Unidad("hectometro²","hm²",1e4);
      Area.Agregar_Unidad("decametro²","dam²",100);
      Area.Agregar_Unidad("decimetro²","dm²",0.01);
      Area.Agregar_Unidad("centímetro²","cm²",0.0001);
      Area.Agregar_Unidad("milímetro²","mm²",1e-6);
      Area.Agregar_Unidad("micrometro²","μm²",1e-12);
      Area.Agregar_Unidad("nanometro²","nm²",1e-18);
      Area.Agregar_Unidad("hectárea","ha",10000);
      Area.Agregar_Unidad("área","a",100);
      Area.Agregar_Unidad("barn","b",1e-28);
      Area.Agregar_Unidad("milla²","mi²",2589988.11);
      Area.Agregar_Unidad("yarda²","yd²",0.9144*0.9144);
      Area.Agregar_Unidad("pie²","ft²",0.3048*0.3048);
      Area.Agregar_Unidad("pulgada²","in²",0.0254*0.0254);
      Area.Agregar_Unidad("township","twp",9656.064*9656.064);
      Area.Agregar_Unidad("section","sec",1609.344*1609.344);
      Area.Agregar_Unidad("acre","ac,A",Math.pow(Math.sqrt(6272640)*0.0254,2));
      Area.Agregar_Unidad("rood","ro",Math.pow(Math.sqrt(1568160)*0.0254,2));
      Area.Agregar_Unidad("cadena²","ch²",Math.pow(Math.sqrt(627264)*0.0254,2));
      Area.Agregar_Unidad("rod²","rd²",5.0292*5.0292);
      Area.Agregar_Unidad("perch²","pch²",5.0292*5.0292);
      Area.Agregar_Unidad("pole²","po²",5.0292*5.0292);
      Area.Agregar_Unidad("arpent","arp",Math.pow(Math.sqrt(6264000)*0.0254,2));
      Area.Agregar_Unidad("cuerda","cda",3030.395625);
      Area.Agregar_Unidad("plaza","plz",6400);
      Area.Agregar_Unidad("varas castellanas cuad","vcc",0.698737);
      Clase_Magnitud_Fisica Capacidad_de_Almacenamiento=new Clase_Magnitud_Fisica("Capacidad_de_Almacenamiento");
      //Capacidad_de_Almacenamiento.Agregar_Unidad("","",);
      Capacidad_de_Almacenamiento.Agregar_Unidad("bit","b",1);
      Capacidad_de_Almacenamiento.Agregar_Unidad("nibble","n",4);
      Capacidad_de_Almacenamiento.Agregar_Unidad("byte","B",8);
      Capacidad_de_Almacenamiento.Agregar_Unidad("word","w",16);
      Capacidad_de_Almacenamiento.Agregar_Unidad("double-word","dw",32);
      Capacidad_de_Almacenamiento.Agregar_Unidad("quadruple-word","qw",64);
      Capacidad_de_Almacenamiento.Agregar_Unidad("block","bck",4096);
      Capacidad_de_Almacenamiento.Agregar_Unidad("kilobit","kb",1024);
      Capacidad_de_Almacenamiento.Agregar_Unidad("kilobyte","kB,KiB",8192);
      Capacidad_de_Almacenamiento.Agregar_Unidad("kilobyte(10^3)","kB",8000);
      Capacidad_de_Almacenamiento.Agregar_Unidad("megabit","Mb",1048576);
      Capacidad_de_Almacenamiento.Agregar_Unidad("megabyte","MB,MiB",8388608);
      Capacidad_de_Almacenamiento.Agregar_Unidad("megabyte(10^6)","MB",8000000);
      Capacidad_de_Almacenamiento.Agregar_Unidad("gigabit","Gb",1073741824);
      Capacidad_de_Almacenamiento.Agregar_Unidad("gigabyte","GB,Gib",(double)8*1073741824);
      Capacidad_de_Almacenamiento.Agregar_Unidad("gigabyte(10^9)","GB",(double)8e9);
      Capacidad_de_Almacenamiento.Agregar_Unidad("terabit","Tb",(double)1024*1073741824);
      Capacidad_de_Almacenamiento.Agregar_Unidad("terabyte","TB,TiB",(double)8192*1073741824);
      Capacidad_de_Almacenamiento.Agregar_Unidad("terabyte(10^12)","TB",8e12);
      Capacidad_de_Almacenamiento.Agregar_Unidad("petabit","Pb",(double)1048576*1073741824);
      Capacidad_de_Almacenamiento.Agregar_Unidad("petabyte","PB,PiB",(double)8388608*1073741824);
      Capacidad_de_Almacenamiento.Agregar_Unidad("petabyte(10^15)","PB",8e15);
      Capacidad_de_Almacenamiento.Agregar_Unidad("exabit","Eb",Math.pow(2,60));
      Capacidad_de_Almacenamiento.Agregar_Unidad("exabyte","EB,EiB",Math.pow(2,63));
      Capacidad_de_Almacenamiento.Agregar_Unidad("exabyte(10^18)","EB",10e18);
      Clase_Magnitud_Fisica Densidad=new Clase_Magnitud_Fisica("Densidad");
      //Densidad.Agregar_Unidad("","",);
      double lb_in3=lb/Math.pow(in/100,3);
      Densidad.Agregar_Unidad("kilogramo/metro³","kg/m³",1);
      Densidad.Agregar_Unidad("kilogramo/centímetro³","kg/cm³",1e6);
      Densidad.Agregar_Unidad("gramo/metro³","g/m³",1e-3);
      Densidad.Agregar_Unidad("gramo/centímetro³","g/cm³",1000);
      Densidad.Agregar_Unidad("gramo/milimetro³","g/mm³",1e6);
      Densidad.Agregar_Unidad("miligramo/metro³","mg/m³",1e-6);
      Densidad.Agregar_Unidad("miligramo/centímetro³","mg/cm³",1);
      Densidad.Agregar_Unidad("miligramo/milímetro³","mg/mm³",1e-3);
      Densidad.Agregar_Unidad("exagramo/litro","Eg/l",1e18);
      Densidad.Agregar_Unidad("petagramo/litro","Pg/l",1e15);
      Densidad.Agregar_Unidad("teragramo/litro","Tg/l",1e12);
      Densidad.Agregar_Unidad("gigagramo/litro","Gg/l",1e9);
      Densidad.Agregar_Unidad("megagramo/litro","Mg/l",1e6);
      Densidad.Agregar_Unidad("kilogramo/litro","kg/l",1e3);
      Densidad.Agregar_Unidad("hectogramo/litro","hg/l",100);
      Densidad.Agregar_Unidad("decagramo/litro","dg/l",10);
      Densidad.Agregar_Unidad("gramo/litro","g/l",1);
      Densidad.Agregar_Unidad("decigramo/litro","dg/l",1e-1);
      Densidad.Agregar_Unidad("centigramo/litro","cg/l",1e-2);
      Densidad.Agregar_Unidad("milígramo/lito","mg/l",1e-3);
      Densidad.Agregar_Unidad("microgramo/litro","μg/l",1e-6);
      Densidad.Agregar_Unidad("nanogramo/litro","ng/l",1e-9);
      Densidad.Agregar_Unidad("picogramo/litro","pg/l",1e-12);
      Densidad.Agregar_Unidad("femtogramo/litro","fg/l",1e-15);
      Densidad.Agregar_Unidad("attogramo/l","ag/l",1e-18);
      Densidad.Agregar_Unidad("libra/pulgada³","lb/in³",lb_in3);
      Densidad.Agregar_Unidad("libra/pie³","lb/ft³",(double)lb_in3/1728);
      Densidad.Agregar_Unidad("libra/galón","lb/gal",(double)lb_in3/231);
      Densidad.Agregar_Unidad("onza/pulgada³","oz/in³",(double)lb_in3/16);
      Densidad.Agregar_Unidad("onza/pie³","oz/ft³",(double)lb_in3/27648);
      Densidad.Agregar_Unidad("onza/galón","oz/gal",(double)lb_in3/3696);
      Densidad.Agregar_Unidad("ton/yarda³","tn/yd³",(double)lb_in3/27.328);
      Clase_Magnitud_Fisica Energia=new Clase_Magnitud_Fisica("Energía, Trabajo");
      //Energia.Agregar_Unidad("","",);
      Energia.Agregar_Unidad("joule","J",1);
      Energia.Agregar_Unidad("gigajoule","GJ",1e9);
      Energia.Agregar_Unidad("megajoule","MJ",1e6);
      Energia.Agregar_Unidad("kilojoule","kJ",1e3);
      Energia.Agregar_Unidad("milijoule","mJ",1e-3);
      Energia.Agregar_Unidad("microjoule","μJ",1e-6);
      Energia.Agregar_Unidad("nanojoule","nJ",1e-9);
      Energia.Agregar_Unidad("picojoule","pJ",1e-12);
      Energia.Agregar_Unidad("femtojoule","fJ",1e-15);
      Energia.Agregar_Unidad("attojoule","aJ",1e-18);
      Energia.Agregar_Unidad("erg","e",1e-7);
      Energia.Agregar_Unidad("gigawatt-hora","GW h",36*1e11);
      Energia.Agregar_Unidad("megawatt-hora","MW h",36*1e8);
      Energia.Agregar_Unidad("kilowatt-hora","KW h",36*1e5);
      Energia.Agregar_Unidad("watt-hora","Wh",36*1e2);
      Energia.Agregar_Unidad("kilowatt-segundo","kW s",1e3);
      Energia.Agregar_Unidad("wat-segundo","W s",1);
      Energia.Agregar_Unidad("caballo-hora","hp h",745.699872*3600);
      Energia.Agregar_Unidad("kilocaloría(int.)","kcal",4.1868*1e3);
      Energia.Agregar_Unidad("caloría(in)","cal",4.1868);
      Energia.Agregar_Unidad("kilocaloría(TQuím.)","kcal(TQuím.)",4.184*1e3);
      Energia.Agregar_Unidad("caloría(TQuím)","cal(TQuím)",4.184);
      Energia.Agregar_Unidad("BTU(int).","BTU",1055.05585262);
      Energia.Agregar_Unidad("BTU(TQuím.)","BTU(TQuím.)",1054.35);
      Energia.Agregar_Unidad("megaBTU","MBTU",1055.05585262*1e3);
      Energia.Agregar_Unidad("ton-hora(refrigeración)","RT h",12660670.23);
      Energia.Agregar_Unidad("gigaton","Gt",4.184e18);
      Energia.Agregar_Unidad("megaton","Mt",4.184e15);
      Energia.Agregar_Unidad("kiloton","kt",4.184e12);
      Energia.Agregar_Unidad("ton","t",4.184e9);
      Energia.Agregar_Unidad("newton-metro","Nm",1e3);
      Energia.Agregar_Unidad("dina-centímetro","dyn cm",1e-4);
      Energia.Agregar_Unidad("gramo fuerza-metro","gf m",(double)0.00980665);
      Energia.Agregar_Unidad("gramo fuerza-centímetro","gf cm",(double)0.0000980665);
      Energia.Agregar_Unidad("kilogramo fuerza-metro","kgf m",9.80665);
      Energia.Agregar_Unidad("kilogramo fuerza-centímetro","kgf cm",0.0980665);
      Energia.Agregar_Unidad("libra fuerza-pie","lbf ft",1.255817948);
      Energia.Agregar_Unidad("libra fuerza-pulgada","lbf in",12*1.255817948);
      Energia.Agregar_Unidad("onza fuerza-pulgada","ozf in",192*1.255817948);
      Energia.Agregar_Unidad("pie-libra","ft lb",1.255817948);
      Energia.Agregar_Unidad("pulgada-libra","in lb",12*1.255817948);
      Energia.Agregar_Unidad("pulgada-onza","in oz",192*1.255817948);
      Energia.Agregar_Unidad("megaelectronvolt","MeV",1.6021*1e-13);
      Energia.Agregar_Unidad("kiloelectonvolt","keV",1.6021*1e-16);
      Energia.Agregar_Unidad("electronvolt","eV",1.6021*1e-19);
      Energia.Agregar_Unidad("therm","thm",105505600);
      Energia.Agregar_Unidad("therm(US)","thm",105480400);
      Energia.Agregar_Unidad("hartree","Eh",4.35974434*1e-18);
      Clase_Magnitud_Fisica Flujo_Volumetrico=new Clase_Magnitud_Fisica("Flujo_Volumétrico");
      //Flujo_Volumetrico.Agregar_Unidad("","",);
      in=0.0254;
      double yd3=(double)Math.pow((double)1143/1250,3), in3=Math.pow(in,3),galUS=0.003785411784,galUK=0.004546090282;
      Flujo_Volumetrico.Agregar_Unidad("metro³/segundo","m³/s",1);
      Flujo_Volumetrico.Agregar_Unidad("metro³/minuto","m³/min",(double)1/60);
      Flujo_Volumetrico.Agregar_Unidad("metro³/hora","m³/h",(double)1/3600);
      Flujo_Volumetrico.Agregar_Unidad("metro³/día","m³/d",(double)1/86400);
      Flujo_Volumetrico.Agregar_Unidad("centímetro³/segundo","cm³/d",1e-6);
      Flujo_Volumetrico.Agregar_Unidad("centímetro³/minuto","cm³/min",1/6e7);
      Flujo_Volumetrico.Agregar_Unidad("centímetro³/hora","cm³/h",1/3.6e9);
      Flujo_Volumetrico.Agregar_Unidad("centímetro³/día","cm³/d",1/8.64e10);
      Flujo_Volumetrico.Agregar_Unidad("litro/segundo","l/s",1e-3);
      Flujo_Volumetrico.Agregar_Unidad("litro/minuto","l/min",1/6e4);
      Flujo_Volumetrico.Agregar_Unidad("litro/hora","l/h",1/3.6e6);
      Flujo_Volumetrico.Agregar_Unidad("litro/día","l/d",1/8.64e7);
      Flujo_Volumetrico.Agregar_Unidad("mililitro/segundo","l/s",1e-6);
      Flujo_Volumetrico.Agregar_Unidad("mililitro/minuto","l/min",1/6e7);
      Flujo_Volumetrico.Agregar_Unidad("mililitro/hora","l/h",1/3.6e9);
      Flujo_Volumetrico.Agregar_Unidad("mililitro/día","l/d",1/8.64e10);
      Flujo_Volumetrico.Agregar_Unidad("pulgada³/segundo","in³/s",(double)in3);
      Flujo_Volumetrico.Agregar_Unidad("pulgada³/minuto","in³/min",(double)in3/60);
      Flujo_Volumetrico.Agregar_Unidad("pulgada³/hora","in³/h",(double)in3/3600);
      Flujo_Volumetrico.Agregar_Unidad("pulgada³/día","in³/d",(double)in3/86400);
      Flujo_Volumetrico.Agregar_Unidad("pie³/segundo","ft³/s",(1728*in3));
      Flujo_Volumetrico.Agregar_Unidad("pie³/minuto","ft³/min",(1728*in3)/60);
      Flujo_Volumetrico.Agregar_Unidad("pie³/hora","ft³/h",(1728*in3)/3600);
      Flujo_Volumetrico.Agregar_Unidad("pie³/dia","ft³/d",(1728*in3)/86400);
      Flujo_Volumetrico.Agregar_Unidad("yarda³/segundo","yd³/s",yd3);
      Flujo_Volumetrico.Agregar_Unidad("yarda³/minuto","yd/min",yd3*(double)1/60);
      Flujo_Volumetrico.Agregar_Unidad("yarda³/hora","yd/h",yd3*(double)1/3600);
      Flujo_Volumetrico.Agregar_Unidad("yarda³/día","yd³/d",yd3*(double)1/86400);
      Flujo_Volumetrico.Agregar_Unidad("galón/segundo","gal/s",galUS);
      Flujo_Volumetrico.Agregar_Unidad("galón/minuto","gal/min",(double)galUS/60);
      Flujo_Volumetrico.Agregar_Unidad("galón/hora","gal/h",(double)galUS/3600);
      Flujo_Volumetrico.Agregar_Unidad("galón/día","gal/d",(double)galUS/86400);
      Flujo_Volumetrico.Agregar_Unidad("galón(UK)/segundo","gal(UK)/s",galUK);
      Flujo_Volumetrico.Agregar_Unidad("galón(UK)/minuto","gal(UK)/min",(double)galUK/60);
      Flujo_Volumetrico.Agregar_Unidad("galón(UK)/hora","gal(UK)/h",(double)galUK/3600);
      Flujo_Volumetrico.Agregar_Unidad("galón(UK)/día","gal(UK)/d",(double)galUK/86400);
      Clase_Magnitud_Fisica Fuerza=new Clase_Magnitud_Fisica("Fuerza");
      //Fuerza.Agregar_Unidad("","",);
      Fuerza.Agregar_Unidad("newton","N",1);
      Fuerza.Agregar_Unidad("exanewton","EN",1e18);
      Fuerza.Agregar_Unidad("petanewton","PN",1e15);
      Fuerza.Agregar_Unidad("teranewton","TN",1e12);
      Fuerza.Agregar_Unidad("giganewton","GN",1e9);
      Fuerza.Agregar_Unidad("meganewton","MN",1e6);
      Fuerza.Agregar_Unidad("kilonewton","kN",1e3);
      Fuerza.Agregar_Unidad("hectonewton","hN",1e2);
      Fuerza.Agregar_Unidad("decanewton","daN",10);
      Fuerza.Agregar_Unidad("decinewton","dN",1e-1);
      Fuerza.Agregar_Unidad("centinewton","cN",1e-2);
      Fuerza.Agregar_Unidad("milinewton","mN",1e-3);
      Fuerza.Agregar_Unidad("micronewton","μN",1e-6);
      Fuerza.Agregar_Unidad("nanonewton","nN",1e-9);
      Fuerza.Agregar_Unidad("piconewton","pN",1e-12);
      Fuerza.Agregar_Unidad("femtonewton","fN",1e-15);
      Fuerza.Agregar_Unidad("attonewton","aN",1e-18);
      Fuerza.Agregar_Unidad("dina","dyn",1e-5);
      Fuerza.Agregar_Unidad("joule/metro","J/m",1);
      Fuerza.Agregar_Unidad("joule/centímetro","J/cm",1e-2);
      Fuerza.Agregar_Unidad("kilogramo fuerza","kgf",9.80665);
      Fuerza.Agregar_Unidad("gramo fuerza","gf",0.00980665);
      Fuerza.Agregar_Unidad("kip fuerza","kip f",4448.221615);
      Fuerza.Agregar_Unidad("libra fuerza","lbf",4.448221615);
      Fuerza.Agregar_Unidad("onza fuerza","ozf",4.448221615/16);
      Clase_Magnitud_Fisica Longitud=new Clase_Magnitud_Fisica("Longitud");
      Clase_Magnitud_Fisica Masa=new Clase_Magnitud_Fisica("Masa");
      Clase_Magnitud_Fisica Potencia=new Clase_Magnitud_Fisica("Potencia");
      Clase_Magnitud_Fisica Presion=new Clase_Magnitud_Fisica("Presion");
      Clase_Magnitud_Fisica Temperatura=new Clase_Magnitud_Fisica("Tiempo");
      Clase_Magnitud_Fisica Velocidad=new Clase_Magnitud_Fisica("Velocidad");
      Clase_Magnitud_Fisica Volumen=new Clase_Magnitud_Fisica("Volumen");
      this.addItem(Angulo);
      this.addItem(Area);
      this.addItem(Capacidad_de_Almacenamiento);
      this.addItem(Densidad);
      this.addItem(Energia);
      this.addItem(Flujo_Volumetrico);
      this.addItem(Fuerza);
      this.addItem(Longitud);
      this.addItem(Masa);
      this.addItem(Potencia);
      this.addItem(Presion);
      this.addItem(Temperatura);
      this.addItem(Velocidad);
      this.addItem(Volumen);
    }
}
