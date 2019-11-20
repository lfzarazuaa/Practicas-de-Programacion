using System;

namespace CoreEscuela.Entidades
{
    public class Curso
    {
        public Curso()
        {
            UniqueId = Guid.NewGuid().ToString();
        }

        public string UniqueId{ get; private set;}
        public string Nombre { get; set; }
        public TiposJornada Jornada { get; set; }
        
        public override string ToString()
        {
            return $"Nombre: {this.Nombre} ID: {this.UniqueId}";
        }
    }
}