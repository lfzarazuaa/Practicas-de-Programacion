using System;
using System.Collections.Generic;//Para poder usar List
using CoreEscuela.Entidades;
using static System.Console;

namespace Etapa1
{
    class Program
    {
        static void Main(string[] args)
        {
            var escuela = new Escuela("Platzi Academy",1996,
                            TiposEscuela.Primaria,pais:"México",ciudad:"CDMX");           
            
            escuela.Cursos = new List<Curso>(){
                    new Curso() {Nombre="101"},
                    new Curso() {Nombre="201"},
                    new Curso() {Nombre="301"}
            };
            escuela.Cursos.Add(new Curso(){ Nombre = "102", Jornada = TiposJornada.Tarde});
            escuela.Cursos.Add(new Curso(){ Nombre = "202", Jornada = TiposJornada.Tarde});

            var otraColeccion= new List<Curso>(){
                    new Curso() { Nombre = "401", Jornada = TiposJornada.Mañana},
                    new Curso() { Nombre = "501", Jornada = TiposJornada.Mañana},
                    new Curso() { Nombre = "601", Jornada = TiposJornada.Mañana}
            };
            
            
            escuela.Cursos.AddRange(otraColeccion);
            Curso tmp = new Curso{Nombre = "103-Vacacional", Jornada = TiposJornada.Noche};
            escuela.Cursos.Add(tmp);
            Console.WriteLine(escuela);
            ImprimirCursosEscuela(escuela);

            Predicate<Curso> miAlgoritmo = predicado;//Función segura como parámetro.
            escuela.Cursos.RemoveAll(miAlgoritmo);
            escuela.Cursos.RemoveAll(delegate (Curso cur)
            {
                return cur.Nombre == "201";
            });//Expresión delegate.

            escuela.Cursos.RemoveAll( (cur) => cur.Nombre == "101");//Expresión Lambda.

            ImprimirCursosEscuela(escuela);

           /*  escuela.CursosA = new Curso[]{
                            new Curso() {Nombre="101"},
                            new Curso() {Nombre="201"},
                            new Curso() {Nombre="301"}
                        }; */

           /*  Curso[] arregloCursos = {
                 new Curso() {Nombre="101"},
                 new Curso() {Nombre="201"},
                 new Curso() {Nombre="301"}
            }; */

            /* var arregloCursos = new Curso[3]{
                 new Curso() {Nombre="101"},
                 new Curso() {Nombre="201"},
                 new Curso() {Nombre="301"}
            }; */

            //arregloCursos[0] = new Curso() {Nombre="101"};
            //arregloCursos[1] = new Curso() {Nombre="201"};
            //arregloCursos[2] = new Curso() {Nombre="301"};
            
            /* ImprimirCursosWhile(escuela.Cursos);
            WriteLine("==============");
            ImprimirCursosDoWhile(escuela.Cursos);
            WriteLine("==============");
            ImprimirCursosFor(escuela.Cursos); */
        }

        private static bool predicado(Curso curobj)
        {
           return curobj.Nombre == "301";
        }
        private static void ImprimirCursosEscuela(Escuela escuela)
        {
            WriteLine("==============");
            WriteLine("Cursos Escuela");
            WriteLine("==============");
            if (escuela?.Cursos !=  null){
                foreach (var curso in escuela.Cursos)
                {
                    WriteLine(curso);
                }
            }
            
        }

        private static void ImprimirCursosWhile(Curso[] arregloCursos)
        {
            int contador = 0;
            while (contador < arregloCursos.Length)
            {
                WriteLine(arregloCursos[contador]);
                contador++;
            }
        }

        private static void ImprimirCursosDoWhile(Curso[] arregloCursos)
        {
            int contador = 0;
            do
            {
                WriteLine(arregloCursos[contador]);
            }while (++contador < arregloCursos.Length);
        }

        private static void ImprimirCursosFor(Curso[] arregloCursos)
        {
            for (int i = 0; i < arregloCursos.Length; i++)
            {
                WriteLine(arregloCursos[i]);
            }
        }

        private static void ImprimirCursosForeach(Curso[] arregloCursos)
        {
            foreach (var curso in arregloCursos)
            {
                WriteLine(curso);
            }
        }
    }
}
