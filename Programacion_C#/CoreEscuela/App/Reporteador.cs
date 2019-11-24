using System;
using System.Linq;
using System.Collections.Generic;
using CoreEscuela.Entidades;

namespace CoreEscuela.App
{
    public class Reporteador
    {
        Dictionary<LLaveDiccionario,List<ObjetoEscuelaBase>> _diccionario;
        public Reporteador(Dictionary<LLaveDiccionario, List<ObjetoEscuelaBase>> dicObsEsc)
        {
            if (dicObsEsc == null)
                throw new ArgumentNullException(nameof(dicObsEsc));
            _diccionario=dicObsEsc;
        }

        public IEnumerable<Evaluación> GetListaEvaluaciones()
        {
            if (_diccionario.TryGetValue(LLaveDiccionario.Evaluación, out List<ObjetoEscuelaBase> listaObj))
            {
                return listaObj.Cast<Evaluación>();
            }
            else
            {
                return new List<Evaluación>();
            }
        }

        public IEnumerable<string> GetListaAsignaturas(out IEnumerable<Evaluación> listaEvaluaciones)
        {
            listaEvaluaciones = GetListaEvaluaciones();

            return (from Evaluación ev in listaEvaluaciones
                    select ev.Asignatura.Nombre).Distinct();
        }
        public IEnumerable<string> GetListaAsignaturas()
        {
            return GetListaAsignaturas(out var dummy);
        }

        public Dictionary<string, IEnumerable<Evaluación>> GetDicEvaluaXAsig(){
            var dictaRta = new Dictionary<string, IEnumerable<Evaluación>>();
            IEnumerable<string> listaAsignaturas = GetListaAsignaturas(out IEnumerable<Evaluación> listaEvaluaciones);
            foreach (var asig in listaAsignaturas)
            {
                var evalAsignatura= from eval in listaEvaluaciones
                                    where eval.Asignatura.Nombre == asig//Condiciona que solo queden las asignaturas de las evaluaciones que coinciden con la lista de asignaturas.
                                    select eval;

                dictaRta.Add(asig,evalAsignatura);
            }
            return dictaRta;
        }

        public Dictionary<string, IEnumerable<object>> GetPromedioAlumnosPorAsignaturas() 
        {
            var rta = new Dictionary<string, IEnumerable<object>>();
            Dictionary<string, IEnumerable<Evaluación>> dicEvalXAsig=GetDicEvaluaXAsig();
            foreach (var asigConEval in dicEvalXAsig)
            {
                var promsAlumnos = from eval in asigConEval.Value//Obtiene los valores del diccionario como elemento para hacer el recorrimiento.
                            group eval by new {eval.Alumno.UniqueId, eval.Alumno.Nombre}//eval es la variable recorrida, pero esta no es accesible puesto que es agrupada por UniqueId de Alumno.
                            into grupoEvalsAlumno // La variable que contiene los datos agrupados se llama grupoEvalsAlumno
                            select new AlumnoPromedio()
                            {
                                AlumnoId = grupoEvalsAlumno.Key.UniqueId,//Obtiene el identificador que este caso es el primer dato tomado pero como es el mismo para cada Alumno en su respectiva evaluacion no importa.
                                Nombre = grupoEvalsAlumno.Key.Nombre,
                                Promedio = grupoEvalsAlumno.Average(evaluación => evaluación.Nota),//Del arreglo de datos que contiene grupoEvalsAlumno obtiene el método
                                //PromedioD = grupoEvalsAlumno.Average(delegate(Evaluación eval2) {return eval2.Nota;})
                            };
                rta.Add(asigConEval.Key,promsAlumnos);
            }

            return rta;
        }

        public Dictionary<string, IEnumerable<object>> GetMejoresPromediosPorAsignaturas(int X=10) 
        {
            var rta = new Dictionary<string, IEnumerable<object>>();
            Dictionary<string, IEnumerable<Evaluación>> dicEvalXAsig=GetDicEvaluaXAsig();//Obtiene el diccionario de todas las evaluaciones.
            foreach (var asigConEval in dicEvalXAsig)//Lee cada elemento del diccionario.
            {
                var promsAlumnos = (from eval in asigConEval.Value//Obtiene los valores del diccionario como elemento para hacer el recorrimiento.
                            group eval by new {eval.Alumno.UniqueId, eval.Alumno.Nombre}//eval es la variable recorrida, pero esta no es accesible puesto que es agrupada por UniqueId de Alumno.
                            into grupoEvalsAlumno // La variable que contiene los datos agrupados se llama grupoEvalsAlumno
                            select new AlumnoPromedio()
                            {
                                AlumnoId = grupoEvalsAlumno.Key.UniqueId,//Obtiene el identificador que este caso es el primer dato tomado pero como es el mismo para cada Alumno en su respectiva evaluacion no importa.
                                Nombre = grupoEvalsAlumno.Key.Nombre,
                                Promedio = grupoEvalsAlumno.Average(evaluación => evaluación.Nota),//Del arreglo de datos que contiene grupoEvalsAlumno obtiene el método
                                //PromedioD = grupoEvalsAlumno.Average(delegate(Evaluación eval2) {return eval2.Nota;})
                            }).OrderByDescending(delegate(AlumnoPromedio ap){return ap.Promedio;}).Take(X);
                rta.Add(asigConEval.Key,promsAlumnos);
            }
            
            return rta;
        }

        private object Ordenar(AlumnoPromedio alumnoProm)
        {
            return alumnoProm.Promedio;
        }
    }
}