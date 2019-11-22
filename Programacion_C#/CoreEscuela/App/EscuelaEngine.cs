using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;
using CoreEscuela.Entidades;

namespace CoreEscuela
{
    public sealed class EscuelaEngine
    {
        public Escuela Escuela { get; set; }

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

        public Dictionary<LLaveDiccionario, List<ObjetoEscuelaBase>> GetDiccionarioObjetos()
        {
            var diccionario = new Dictionary<LLaveDiccionario, List<ObjetoEscuelaBase>>();
            diccionario.Add(LLaveDiccionario.Escuela, new List<ObjetoEscuelaBase>() { Escuela });
            diccionario.Add(LLaveDiccionario.Curso, Escuela.Cursos.Cast<ObjetoEscuelaBase>().ToList());
            var listatmpev = new List<Evaluación>();
            var listatmpal = new List<Alumno>();
            var listatmpas = new List<Asignatura>();
            foreach (var cursos in Escuela.Cursos)
            {
                listatmpal.AddRange(cursos.Alumnos);
                listatmpas.AddRange(cursos.Asignaturas);
                foreach (var alumnos in cursos.Alumnos)
                {
                    listatmpev.AddRange(alumnos.Evaluaciones);
                }
            }
            diccionario.Add(LLaveDiccionario.Alumno, listatmpal.Cast<ObjetoEscuelaBase>().ToList());

            diccionario.Add(LLaveDiccionario.Asignatura, listatmpas.Cast<ObjetoEscuelaBase>().ToList());

            diccionario.Add(LLaveDiccionario.Evaluación, listatmpev.Cast<ObjetoEscuelaBase>().ToList());

            return diccionario;
        }

    #region Método GetObjetosEscuela
        public IReadOnlyList<ObjetoEscuelaBase> GetObjetosEscuela(
            out int conteoEvaluaciones, out int conteoCursos, out int conteoAsignaturas, out int conteoAlumnos,
            bool traeEvaluaciones = true, bool traeAlumnos = true, bool traeAsignaturas = true, bool traeCursos = true)
        {
            conteoAlumnos = conteoAsignaturas = conteoEvaluaciones = 0;
            var listaObj = new List<ObjetoEscuelaBase>();
            listaObj.Add(Escuela);
            if (traeCursos)
                listaObj.AddRange(Escuela.Cursos);
            conteoCursos = Escuela.Cursos.Count;
            if (traeAsignaturas || traeAlumnos || traeEvaluaciones)
            {
                foreach (var curso in Escuela.Cursos)
                {
                    conteoAsignaturas+=curso.Asignaturas.Count;
                    conteoAlumnos+=curso.Alumnos.Count;
                    if (traeAsignaturas)
                        listaObj.AddRange(curso.Asignaturas);
                    if (traeAlumnos)
                        listaObj.AddRange(curso.Alumnos);

                    if (traeEvaluaciones)
                    {
                        foreach (var alumno in curso.Alumnos)
                        {
                            listaObj.AddRange(alumno.Evaluaciones);
                            conteoEvaluaciones+=alumno.Evaluaciones.Count;
                        }
                    }
                }
            }
            return listaObj.AsReadOnly();
        }

        public IReadOnlyList<ObjetoEscuelaBase> GetObjetosEscuela(
            bool traeEvaluaciones = true, bool traeAlumnos = true, bool traeAsignaturas = true, bool traeCursos = true)
        {   return GetObjetosEscuela(out int dummy, out dummy, out dummy, out dummy,traeEvaluaciones,traeAlumnos,traeAsignaturas,traeCursos);}

        public IReadOnlyList<ObjetoEscuelaBase> GetObjetosEscuela(
            out int conteoEvaluaciones,
            bool traeEvaluaciones = true, bool traeAlumnos = true, bool traeAsignaturas = true, bool traeCursos = true)
        {   return GetObjetosEscuela(out conteoEvaluaciones, out int dummy, out dummy, out dummy,traeEvaluaciones,traeAlumnos,traeAsignaturas,traeCursos);}

        public IReadOnlyList<ObjetoEscuelaBase> GetObjetosEscuela(
            out int conteoEvaluaciones, out int conteoCursos,
            bool traeEvaluaciones = true, bool traeAlumnos = true, bool traeAsignaturas = true, bool traeCursos = true)
        {   return GetObjetosEscuela(out conteoEvaluaciones, out conteoCursos, out int dummy, out dummy,traeEvaluaciones,traeAlumnos,traeAsignaturas,traeCursos);}

        public IReadOnlyList<ObjetoEscuelaBase> GetObjetosEscuela(
            out int conteoEvaluaciones, out int conteoCursos, out int conteoAsignaturas,
            bool traeEvaluaciones = true, bool traeAlumnos = true, bool traeAsignaturas = true, bool traeCursos = true)
        {   return GetObjetosEscuela(out conteoEvaluaciones, out conteoCursos, out conteoAsignaturas, out int dummy,traeEvaluaciones,traeAlumnos,traeAsignaturas,traeCursos);}
    #endregion

    #region Métodos de carga.
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
                string[] formato = { "Presencial", "Web", "Grabado", "Preadquirido" };
                string[] TipoEvaluacion = { "Escrito", "Práctico", "Oral" };
                foreach (var alumno in curso.Alumnos)
                {
                    foreach (var asignatura in curso.Asignaturas)
                    {
                        for (int cont = 0; cont < 5; cont++)
                        {
                            Random rnd = new Random();
                            string fo = formato[rnd.Next(0, formato.Length)];
                            string ti = TipoEvaluacion[rnd.Next(0, TipoEvaluacion.Length)];
                            var evaluacion = new Evaluación()
                            {
                                Nombre = $"Examen {fo} {ti} de {alumno.Nombre}",
                                Alumno = alumno,
                                Asignatura = asignatura,
                                Nota = rnd.NextDouble() * 5
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
                curso.Asignaturas = listaAsignaturas;
            }
        }

        private List<Alumno> GenerarAlumnosAlAzar(int cantidad = 30)
        {
            string[] nombre1 = { "Alba", "Felipe", "Eusebio", "Farid", "Donald", "Alvaro", "Nicolas" }; //
            string[] apellido1 = { "Ruiz", "Sarmiento", "Uribe", "Maduro", "Trump", "Toledo", "Herrera" };//
            string[] nombre2 = { "Freddy", "Anabel", "Rick", "Murty", "Silvana", "Diomedes", "Nicomedes", "Teodoro" };//

            var listaAlumnos = from n1 in nombre1
                               from n2 in nombre2
                               from a1 in apellido1
                               select new Alumno { Nombre = $"{n1} {n2} {a1}" };//Uso de Linq.

            return listaAlumnos.OrderBy((al) => al.UniqueId).Take(cantidad).ToList();
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
            Random random = new Random();

            foreach (var curso in Escuela.Cursos)
            {
                int cantRandom = random.Next(5, 50);
                curso.Alumnos = GenerarAlumnosAlAzar(cantRandom);
            }
        }
#endregion
    }
}