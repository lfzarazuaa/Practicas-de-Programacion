﻿using System;
using System.Collections.Generic;//Para poder usar List
using System.Linq;
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
            Printer.WriteTitle("BIENVENIDOS A LA ESCUELA");
            //Printer.Beep(1000, cantidad: 1);
            ImprimirCursosEscuela(engine.Escuela);
            PruebaDiccionario();
            var dicObjetos=engine.GetDiccionarioObjetos();
        }

        private static void ImprimirCursosEscuela(Escuela escuela)
        {
            Printer.WriteTitle("Cursos de la Escuela");
            if (escuela?.Cursos !=  null){
                foreach (var curso in escuela.Cursos)
                {
                    WriteLine(curso);
                }
            }
        }
        private static void PruebaDiccionario()
        {
            Dictionary<int, string> diccionario = new Dictionary<int, string>();
            diccionario.Add(10, "JuanK");
            diccionario.Add(23, "Lorem Ipsum");

            foreach (var keyValPair in diccionario)
            {
                System.Console.WriteLine($"Key: {keyValPair.Key} Valor:{keyValPair.Value}");
            }

            Printer.WriteTitle("Acceso a Diccionario.");
            diccionario[0] = "Pekerman";
            WriteLine(diccionario[0]);
            WriteLine("Otro diccionario");
            var dic = new Dictionary<string, string>();
            dic["Luna"] = "Cuerpo Celeste qie gira alrededor de la tierra.";
            WriteLine(dic["Luna"]);
            dic["Luna"] = "Protagonista de caricatura.";
            WriteLine(dic["Luna"]);
        }
        private static void PruebaDeInterfacesReadOnly(EscuelaEngine engine)
        {
            var listaObjetos = engine.GetObjetosEscuela(
                            out int conteoEvaluaciones, out int conteoCursos,
                            out int conteoAsignaturas, out int conteoAlumnos
                        );
            listaObjetos = engine.GetObjetosEscuela(
                out conteoEvaluaciones, out conteoCursos
            );
            var listaIlugar = from obj in listaObjetos
                              where obj is Evaluación
                              select (Evaluación)obj;

            List<Evaluación> Evaluaciones = listaIlugar.ToList();
            //engine.Escuela.LimpiarLugar();
        }
        private static void PruebasDePolimorfismo()
        {
            Printer.DrawLine(20);
            Printer.DrawLine(20);
            Printer.DrawLine(20);
            Printer.WriteTitle("Pruebas de Polimorfismo");
            var alumnoTest = new Alumno { Nombre = "Claire Underwood" };

            ObjetoEscuelaBase ob = alumnoTest;

            Printer.WriteTitle("Alumno");
            WriteLine($"Alumno: {alumnoTest.Nombre}");
            WriteLine($"Alumno: {alumnoTest.UniqueId}");
            WriteLine($"Alumno: {alumnoTest.GetType()}");

            Printer.WriteTitle("ObjetoEscuelaBase");
            WriteLine($"Alumno: {ob.UniqueId}");
            WriteLine($"Alumno: {ob.GetType()}");

            var objetoDummy = new ObjetoEscuelaBase() { Nombre = "Frank Underwood" };
            Printer.WriteTitle("ObjetoEscuelaBase");
            WriteLine($"Alumno: {objetoDummy.UniqueId}");
            WriteLine($"Alumno: {objetoDummy.GetType()}");

            var evaluación = new Evaluación() { Nombre = "Evaluación de math", Nota = 4.5f };
            Printer.WriteTitle("Evaluación");
            WriteLine($"Evaluación: {evaluación.Nombre}");
            WriteLine($"Evaluación: {evaluación.UniqueId}");
            WriteLine($"Evaluación: {evaluación.Nota}");
            WriteLine($"Evaluación: {evaluación.GetType()}");

            ob = (Evaluación)evaluación;
            Printer.WriteTitle("Evaluación");
            WriteLine($"Evaluación: {ob.Nombre}");
            WriteLine($"Evaluación: {ob.UniqueId}");
            WriteLine($"Evaluación: {evaluación.Nota}");
            WriteLine($"Evaluación: {ob.GetType()}");
            if (ob is Alumno)
            {
                Alumno alumnoRecuperado = (Alumno)ob;
            }
            else if (ob is Evaluación)
            {
                Evaluación evaluaciónRecuperada = (Evaluación)ob;
            }

            Alumno alumnoRecuperadoB = ob as Alumno;
            System.Console.WriteLine(alumnoRecuperadoB);
            Evaluación evaluaciónRecuperadaB = ob as Evaluación;
            System.Console.WriteLine(evaluaciónRecuperadaB);

            //alumnoTest= (Alumno) ob;//Marca error ya que no se creo como objeto Alumno.
            //alumnoTest= (Alumno) objetoDummy;//Exepcion
        }
    }
}
