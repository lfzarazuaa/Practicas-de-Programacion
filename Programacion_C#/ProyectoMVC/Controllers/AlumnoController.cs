using System;
using System.Collections.Generic;
using System.Linq;
using Microsoft.AspNetCore.Mvc;
using ProyectoMVC.Models;
namespace ProyectoMVC.Controllers
{
    public class AlumnoController: Controller
    {
        private EscuelaContext _context { get; set; }
        
        public AlumnoController(EscuelaContext context)
        {
            _context=context;
        }

        public IActionResult Index(string Id)
        {
            if (!string.IsNullOrWhiteSpace(Id))
            {
                var alumno = from alumnos in _context.Alumnos
                                 where alumnos.Id == Id
                                 select alumnos;
                var Alumno= alumno.SingleOrDefault();
                if (Alumno!=null)
                {   
                    return View(Alumno);
                }
            }
            return View("MultiAlumno",_context.Alumnos);
        }

        public IActionResult MultiAlumno()
        {
            var listaAlumnos = _context.Alumnos;
            ViewBag.Fecha=DateTime.Now;
            return View(listaAlumnos);//View("MultiAsignatura",listaAsignaturas);
        }

        // private List<Alumno> GenerarAlumnosAlAzar()
        // {
        //     string[] nombre1 = { "Alba", "Felipa", "Eusebio", "Farid", "Donald", "Alvaro", "Nicolás" };
        //     string[] apellido1 = { "Ruiz", "Sarmiento", "Uribe", "Maduro", "Trump", "Toledo", "Herrera" };
        //     string[] nombre2 = { "Freddy", "Anabel", "Rick", "Murty", "Silvana", "Diomedes", "Nicomedes", "Teodoro" };

        //     var listaAlumnos = from n1 in nombre1
        //                        from n2 in nombre2
        //                        from a1 in apellido1
        //                        select new Alumno { Nombre = $"{n1} {n2} {a1}" };

        //     return listaAlumnos.OrderBy((al) => al.Id).ToList();
        // }
    }
}