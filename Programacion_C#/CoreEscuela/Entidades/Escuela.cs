using System;
using System.Collections.Generic;

namespace CoreEscuela.Entidades
{
    public class Escuela : ObjetoEscuelaBase
    {
        //public Escuela (string nombre, int año){
        //    this.nombre = nombre;
        //    AñoDeCreación = año;
        //}
        public Escuela (string nombre, int año) => (Nombre,AñoDeCreación) = (nombre,año);
        public Escuela (string nombre, int año, TiposEscuela tipo, string pais="", string ciudad= "")
             => (Nombre,AñoDeCreación,Pais,Ciudad) = (nombre,año,pais,ciudad);   
        
        private int añoDeCreación;
        public int AñoDeCreación
        {
            get { return añoDeCreación; }
            set { añoDeCreación = value; }
        }
        
        private string pais;
        public string Pais
        {
            get { return pais; }
            set { pais = value; }
        }
        
        public string Ciudad { get; set; }

        public TiposEscuela TipoEscuela{ get; set; }

        public List<Curso> Cursos{ get; set; }
        public Curso[] CursosA { get; set; }
        public override string ToString()
        {
            return $"Nombre: \"{Nombre}\", Tipo: {TipoEscuela} {System.Environment.NewLine} Pais: {Pais}, Ciudad: {Ciudad}";
            //return $"Nombre: \"{Nombre}\", Tipo: {TipoEscuela} \n Pais: {Pais}, Ciudad: {Ciudad}";
        }

    }
}