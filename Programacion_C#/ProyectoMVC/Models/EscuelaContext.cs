using System.Collections.Generic;
using System.Linq;
using Microsoft.EntityFrameworkCore;

namespace ProyectoMVC.Models
{
    public class EscuelaContext: DbContext
    {
        public EscuelaContext(DbContextOptions<EscuelaContext> options): base(options)
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
            var escuela = new Escuela(){
                AñoDeCreación=2005,
                Nombre = "Escuela ESANS",
                Dirección = "Guanabana #137",
                Pais = "México",
                Ciudad = "Ciudad de México",
                TipoEscuela = TiposEscuela.Secundaria
            };

            modelBuilder.Entity<Escuela>().HasData(escuela);//Ejecuta cuando no tiene datos.

            modelBuilder.Entity<Asignatura>().HasData(
                new Asignatura{Nombre="Matemáticas"},
                new Asignatura{Nombre="Educación Física"},
                new Asignatura{Nombre="Español"},
                new Asignatura{Nombre="Ciencias Naturales"}
            );

            modelBuilder.Entity<Alumno>().HasData(GenerarAlumnosAlAzar().ToArray());//Ejecuta cuando no tiene datos.

        }

        private List<Alumno> GenerarAlumnosAlAzar()
        {
            string[] nombre1 = { "Alba", "Felipa", "Eusebio", "Farid", "Donald", "Alvaro", "Nicolás" };
            string[] apellido1 = { "Ruiz", "Sarmiento", "Uribe", "Maduro", "Trump", "Toledo", "Herrera" };
            string[] nombre2 = { "Freddy", "Anabel", "Rick", "Murty", "Silvana", "Diomedes", "Nicomedes", "Teodoro" };

            var listaAlumnos = from n1 in nombre1
                               from n2 in nombre2
                               from a1 in apellido1
                               select new Alumno { Nombre = $"{n1} {n2} {a1}" };

            return listaAlumnos.OrderBy((al) => al.Id).ToList();
        }
    }
}