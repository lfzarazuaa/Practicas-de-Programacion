using System;
using System.Collections.Generic;

namespace CoreEscuela.Entidades
{
    public class Curso
    {
        public Curso() => UniqueId = Guid.NewGuid().ToString();

        public string UniqueId{ get; private set;}
        public string Nombre { get; set; }
        public TiposJornada Jornada { get; set; }
        
        public List<Asignatura> Asignaturas { get; set; } = new List<Asignatura>();
        public List<Alumno> Alumnos { get; set; } = new List<Alumno>();

        public override string ToString()
        {
            return $"Nombre: {this.Nombre} ID: {this.UniqueId}";
        }

    }
}