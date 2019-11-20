using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;
using CoreEscuela.Entidades;

namespace CoreEscuela
{
    public class EscuelaEngine
    {
        public Escuela Escuela {get; set;}

        public EscuelaEngine()
        {

        }

        public void Inicializar()
        {
            Escuela = new Escuela("Platzi Academy", 1996,
                            TiposEscuela.Primaria, pais: "México", ciudad: "CDMX");
            CargarCursos();
            CargarAsignaturas();
            CargarEvaluaciones();

        }
            /// 5 Evaluaciones X Asignatura
            /// Notas al azar entre 0 y 0.5
            /// Cada curso tiene una lista de asignaturas y
            /// cada curso tiene una lista de alumnos.
            /// Cada Evaluación esta mapeada con un alumno y
            /// una asignatura.
            // Nombre de la evaluación creada al azar.
            // 
        private void CargarEvaluaciones()
        {
            foreach (var curso in Escuela.Cursos)
            {
                string[] formato={"Presencial","Web","Grabado","Preadquirido"};
                string[] TipoEvaluacion={"Escrito","Práctico","Oral"};
                foreach (var alumno in curso.Alumnos)
                {
                    foreach (var asignatura in curso.Asignaturas)
                    {
                        for (int cont = 0; cont < 5; cont++)
                        {
                            Random rnd= new Random();
                                string fo=formato[rnd.Next(0,formato.Length)];
                                string ti=TipoEvaluacion[rnd.Next(0,TipoEvaluacion.Length)];
                                var evaluacion = new Evaluación(){Nombre=$"Examen {fo} {ti} de {alumno.Nombre}",
                                Alumno=alumno,Asignatura=asignatura,
                                Nota=rnd.NextDouble()*5
                            };

                            alumno.Evaluaciones.Add(evaluacion);
                        }
                    }
                    
                }
            }
        }

        private void CargarAsignaturas()
        {
            foreach (var curso in Escuela.Cursos)
            {
                var listaAsignaturas = new List<Asignatura>(){
                    new Asignatura() {Nombre = "Matemáticas"},
                    new Asignatura() {Nombre = "Educación Física"},
                    new Asignatura() {Nombre = "Español"},
                    new Asignatura() {Nombre = "Ciencias Naturales"},
                    new Asignatura() {Nombre = "Geografía"},
                    new Asignatura() {Nombre = "Historia"}
                };
                curso.Asignaturas=listaAsignaturas;
            }
        }

        private List<Alumno> GenerarAlumnosAlAzar(int cantidad=30)
        {
           string[] nombre1={"Alba", "Felipe", "Eusebio", "Farid", "Donald", "Alvaro", "Nicolas"}; //
           string[] apellido1={"Ruiz", "Sarmiento", "Uribe", "Maduro", "Trump", "Toledo", "Herrera"};//
           string[] nombre2={"Freddy", "Anabel", "Rick", "Murty", "Silvana", "Diomedes", "Nicomedes","Teodoro"};//

           var listaAlumnos=    from n1 in nombre1
                                from n2 in nombre2
                                from a1 in apellido1
                                select new Alumno{Nombre=$"{n1} {n2} {a1}"};//Uso de Linq.

            return listaAlumnos.OrderBy((al)=> al.UniqueId).Take(cantidad).ToList();
            //return new List<Alumno>(listaAlumnos.OrderBy((al)=> al.UniqueId).Take(cantidad));
        }

        private void CargarCursos()
        {
             Escuela.Cursos = new List<Curso>(){
                    new Curso() {Nombre = "101", Jornada = TiposJornada.Mañana},
                    new Curso() {Nombre = "201", Jornada = TiposJornada.Mañana},
                    new Curso() {Nombre = "301", Jornada = TiposJornada.Mañana},
                    new Curso() {Nombre = "402", Jornada = TiposJornada.Tarde},
                    new Curso() {Nombre = "502", Jornada = TiposJornada.Tarde}
            };
            Random random= new Random();
            
            foreach (var curso in Escuela.Cursos)
            {
                int cantRandom = random.Next(5,50);
                curso.Alumnos=GenerarAlumnosAlAzar(cantRandom);
            }
        }
    }
}