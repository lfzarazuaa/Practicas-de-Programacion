using System;
using System.Collections.Generic;//Para poder usar List
using CoreEscuela.Entidades;
using CoreEscuela.Util;
using static System.Console;

namespace CoreEscuela
{
    class Program
    {
        static void Main(string[] args)
        {
            var engine = new EscuelaEngine();
            engine.Inicializar();
            Printer.EscribirTítulo("BIENVENIDOS A LA ESCUELA");
            Printer.Beep(1000,cantidad:1);
            ImprimirCursosEscuela(engine.Escuela);

        }

        private static void ImprimirCursosEscuela(Escuela escuela)
        {
            Printer.EscribirTítulo("Cursos de la Escuela");
            if (escuela?.Cursos !=  null){
                foreach (var curso in escuela.Cursos)
                {
                    WriteLine(curso);
                }
            }
        }
    }
}
