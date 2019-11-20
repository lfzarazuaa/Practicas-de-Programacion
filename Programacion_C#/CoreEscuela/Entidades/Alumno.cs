using System;
using System.Collections.Generic;

namespace CoreEscuela.Entidades
{
    public class Alumno
    {
        public string UniqueId{ get; private set;}
        public string Nombre { get; set; }
        public List<Evaluación> Evaluaciones { get; set; }
        public Alumno() => (UniqueId, Evaluaciones) = (Guid.NewGuid().ToString(),
                            new List<Evaluación>());//Constructor.
    }
}