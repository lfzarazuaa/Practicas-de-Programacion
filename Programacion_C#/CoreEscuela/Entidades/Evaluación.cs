using System;

namespace CoreEscuela.Entidades
{
    public class Evaluación:ObjetoEscuelaBase
    {
        public Alumno Alumno { get; set; }
        public Asignatura Asignatura { get; set; } = new Asignatura();
        public double Nota;
        public Evaluación() => Alumno = new Alumno();
    }
}