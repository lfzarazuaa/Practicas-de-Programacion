using System;

namespace CoreEscuela.Entidades
{
    public class Evaluacion
    {
        public string UniqueId{ get; private set;} = Guid.NewGuid().ToString();
        public string Nombre { get; set; }
        public string AlumnoId;
        public string AsignaturaId;
        public string Alumno;
        public string Asignatura;
        public uint Parcial;
        public double Nota;
        
    }
}