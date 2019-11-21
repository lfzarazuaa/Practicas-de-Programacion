using System;
using System.Collections.Generic;
using CoreEscuela.Util;

namespace CoreEscuela.Entidades
{
    public class Curso:ObjetoEscuelaBase, ILugar
    {
        public TiposJornada Jornada { get; set; }
        public List<Asignatura> Asignaturas { get; set; } = new List<Asignatura>();
        public List<Alumno> Alumnos { get; set; } = new List<Alumno>();
        public string Dirección { get; set; }

        public override string ToString()
        {
            return $"Nombre: {this.Nombre} ID: {this.UniqueId}";
        }

        public void LimpiarLugar()
        {
            Printer.DrawLine();
            System.Console.WriteLine("Limpiando establecimiento...");
            System.Console.WriteLine($"Curso {Nombre} Limpio");
        }
    }
}