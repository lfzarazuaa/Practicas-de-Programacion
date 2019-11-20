using System;
using System.Collections.Generic;

namespace CoreEscuela.Entidades
{
    public class Asignatura
    {
        public string UniqueId{ get; private set;} = Guid.NewGuid().ToString();
        public string Nombre { get; set; }
    }
}