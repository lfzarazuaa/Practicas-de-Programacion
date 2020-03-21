using System;
using System.Collections.Generic;

namespace ProyectoMVC.Models
{
    public class Curso:ObjetoEscuelaBase
    {
        public string EscuelaId { get; set; }
        public Escuela Escuela { get; set; }
        public TiposJornada Jornada { get; set; }
        public List<Asignatura> Asignaturas{ get; set; }
        public List<Alumno> Alumnos{ get; set; }

        public string Dirección { get; set; }
    }
}