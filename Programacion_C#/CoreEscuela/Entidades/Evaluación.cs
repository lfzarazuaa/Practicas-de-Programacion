using System;

namespace CoreEscuela.Entidades
{
    public class Evaluación
    {
        public string UniqueId{ get; private set;} 
        public string Nombre { get; set; }
        public Alumno Alumno { get; set; }
        public Asignatura Asignatura { get; set; }
        public double Nota;
        public Evaluación() => Guid.NewGuid().ToString();
    }
}