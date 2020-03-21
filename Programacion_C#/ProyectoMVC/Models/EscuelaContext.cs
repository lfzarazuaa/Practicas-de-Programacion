using System;
using System.Collections.Generic;
using System.Linq;
using Microsoft.EntityFrameworkCore;

namespace ProyectoMVC.Models
{
    public class EscuelaContext : DbContext
    {
        public EscuelaContext(DbContextOptions<EscuelaContext> options) : base(options)
        {

        }
        public DbSet<Escuela> Escuelas { get; set; }

        private DbSet<Asignatura> asigntaruras;
        public DbSet<Asignatura> Asignaturas
        {
            get { return asigntaruras; }
            set { asigntaruras = value; }
        }

        public DbSet<Alumno> Alumnos { get; set; }

        public DbSet<Curso> Cursos { get; set; }

        public DbSet<Evaluación> Evaluaciones { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);//Ejecuta el método que sobreescribe.
            var escuela = new Escuela()
            {
                AñoDeCreación = 2005,
                Nombre = "Escuela ESANS",
                Dirección = "Guanabana #137",
                Pais = "México",
                Ciudad = "Ciudad de México",
                TipoEscuela = TiposEscuela.Secundaria
            };
            //Cargar cursos de la escuela.
            var cursos = CargarCursos(escuela);
            //Por cada curso cargar asignaturas y actualiza el curso con su debida asignatura.
            var asignaturas = CargarAsignaturas(cursos);
            //Por cada curso cargar alumnos y actualiza el curso con sus alumnos correspondientes.
            var alumnos = CargarAlumnos(cursos);
            //
            var evaluaciones = CargarEvaluaciones(alumnos,asignaturas);
            //Sembrar datos de la escuela.
            modelBuilder.Entity<Escuela>().HasData(escuela);//Ejecuta cuando no tiene datos.
            //Sembrar datos de la escuela.
            modelBuilder.Entity<Curso>().HasData(cursos.ToArray());//Ejecuta cuando no tiene datos.
            //Sembrar datos de la escuela.
            modelBuilder.Entity<Asignatura>().HasData(asignaturas.ToArray());//Ejecuta cuando no tiene datos.
            //Sembrar datos de la escuela.
            modelBuilder.Entity<Alumno>().HasData(alumnos.ToArray());//Ejecuta cuando no tiene datos.
            
        }

        private static List<Asignatura> CargarAsignaturas(List<Curso> cursos)
        {
            var listaCompleta = new List<Asignatura>();
            foreach (var curso in cursos)
            {
                var tmpLista = new List<Asignatura>
                {
                    new Asignatura { Nombre = "Matemáticas", CursoId = curso.Id},
                    new Asignatura { Nombre = "Educación Física", CursoId = curso.Id},
                    new Asignatura { Nombre = "Español", CursoId = curso.Id},
                    new Asignatura { Nombre = "Ciencias Naturales", CursoId = curso.Id}
                };
                listaCompleta.AddRange(tmpLista);
                //curso.Asignaturas=tmpLista;
            }
            return listaCompleta;
        }

        private static List<Curso> CargarCursos(Escuela escuela)
        {
            return new List<Curso>(){
                new Curso{Nombre="101", EscuelaId = escuela.Id, Jornada = TiposJornada.Mañana},
                new Curso{Nombre="201", EscuelaId = escuela.Id, Jornada = TiposJornada.Tarde},
                new Curso{Nombre="301", EscuelaId = escuela.Id, Jornada = TiposJornada.Noche},
                new Curso{Nombre="401", EscuelaId = escuela.Id, Jornada = TiposJornada.Tarde}
            };
        }
        private List<Alumno> CargarAlumnos(List<Curso> cursos)
        {
            var listaAlumnos = new List<Alumno>();

            Random rnd = new Random();
            foreach (var curso in cursos)
            {
                int numAleatorio = rnd.Next(5,20);
                var tmpLista = GenerarAlumnosAlAzar(curso, numAleatorio);
                listaAlumnos.AddRange(tmpLista);
            }
            return listaAlumnos;
        }

        private List<Alumno> GenerarAlumnosAlAzar(Curso curso, int cantidad)
        {
            string[] nombre1 = { "Alba", "Felipa", "Eusebio", "Farid", "Donald", "Alvaro", "Nicolás" };
            string[] apellido1 = { "Ruiz", "Sarmiento", "Uribe", "Maduro", "Trump", "Toledo", "Herrera" };
            string[] nombre2 = { "Freddy", "Anabel", "Rick", "Murty", "Silvana", "Diomedes", "Nicomedes", "Teodoro" };

            var listaAlumnos = from n1 in nombre1
                               from n2 in nombre2
                               from a1 in apellido1
                               select new Alumno { Nombre = $"{n1} {n2} {a1}" };

            return listaAlumnos.OrderBy((al) => al.Id).Take(cantidad).ToList();
        }

        private static List<Evaluación> CargarEvaluaciones(List<Alumno> alumnos, List<Asignatura> asignaturas) {
            var evaluaciones = new List<Evaluación>();
            foreach (var alumno in alumnos)
            {
                foreach (var asignatura in asignaturas)    
                {
                    var evaluacion = new Evaluación();
                    Random rnd = new Random();
                    evaluacion.Nombre = "Evaluación Parcial";
                    evaluacion.AlumnoId = alumno.Id;
                    evaluacion.AsignaturaId = asignatura.Id;
                    evaluacion.Nota = rnd.Next(1,10);
                    evaluaciones.Add(evaluacion);
                }
            }
            return evaluaciones;
        }
    }
}