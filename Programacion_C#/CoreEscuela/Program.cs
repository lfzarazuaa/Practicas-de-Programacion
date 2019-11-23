using System;
using System.Collections.Generic;//Para poder usar List
using System.Linq;
using CoreEscuela.App;
using CoreEscuela.Entidades;
using CoreEscuela.Util;
using static System.Console;

namespace CoreEscuela
{
    class Program
    {
        static void Main(string[] args)
        {
            AppDomain.CurrentDomain.ProcessExit += AccionDelEvento;
            //AppDomain.CurrentDomain.ProcessExit += (o, s) => Printer.Beep(2000, 1000, 1);
            var engine = new EscuelaEngine();
            engine.Inicializar();
            Printer.WriteTitle("BIENVENIDOS A LA ESCUELA");
            var reporteador = new Reporteador(engine.GetDiccionarioObjetos());
            //new Reporteador(null);
            var evaluaciones=reporteador.GetListaEvaluaciones();
            var asignaturas=reporteador.GetListaAsignaturas();
            var dicEvalXAsig=reporteador.GetDicEvaluaXAsig();
            var listaPromXAsig=reporteador.GetPromedioAlumnosPorAsignaturas();
            var mejoresPromedios=reporteador.GetMejoresPromediosPorAsignaturas(10);
            Printer.WriteTitle("Captura de una evaluación por consola.");
            var eval = new Evaluación ();
            string nombre;
            WriteLine("Ingrese el nombre de la evaluación");
            Printer.PresioneEnter();
            nombre = Console.ReadLine();
            if(string.IsNullOrWhiteSpace(nombre)){
                throw new ArgumentException("El valor del nombre no puede ser vacio.");
            }
            else
            {
                eval.Nombre=nombre.ToLower();
                System.Console.WriteLine("El nombre de la evaluación ha sido ingresado correctamente.");
            }

            WriteLine("Ingrese el valor de la nota");
            Printer.PresioneEnter();
            var notastring = Console.ReadLine();
            if(string.IsNullOrWhiteSpace(notastring)){
                throw new ArgumentException("El valor de la nota no puede ser vacio.");
            }
            else
            {
                try{
                    eval.Nota=double.Parse(notastring);
                    if (eval.Nota < 0 ||eval.Nota > 5)
                    {
                        throw new ArgumentOutOfRangeException("La nota debe estar entre 0 y 5.");
                    }
                    System.Console.WriteLine("El valor de la nota ha sido ingresado correctamente.");
                }
                catch(ArgumentOutOfRangeException arge){
                    Printer.WriteTitle(arge.Message);
                    WriteLine("Saliendo del programa.");
                }
                catch(Exception){
                    Printer.WriteTitle("El valor de la nota no es un número válido.");
                    WriteLine("Saliendo del programa.");
                }
            }
        }

        private static void AccionDelEvento(object sender, EventArgs e)
        {
            Printer.WriteTitle("SALIENDO");
            //Printer.Beep(3000,1000,3);
            Printer.WriteTitle("SALIÓ");
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
        private static void PruebaDictionary(EscuelaEngine engine)
        {

            //Printer.Beep(1000, cantidad: 1);
            ImprimirCursosEscuela(engine.Escuela);
            PruebaDiccionario();
            var dicObjetos = engine.GetDiccionarioObjetos();
            engine.ImprimirDiccionario(dicObjetos, true);
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
