using System;
using System.Collections.Generic;
using Microsoft.AspNetCore.Mvc;
using ProyectoMVC.Models;

namespace ProyectoMVC.Controllers
{
    public class AsignaturaController : Controller
    {
        public IActionResult Index()
        {
            var asignatura = new Asignatura(){
                Nombre = "Programación",
            };
            ViewBag.Fecha=DateTime.Now;
            return View(asignatura);
        }

        public IActionResult MultiAsignatura()
        {
            var listaAsignaturas = new List<Asignatura>(){
                new Asignatura{Nombre="Matemáticas"},
                new Asignatura{Nombre="Educación Física"},
                new Asignatura{Nombre="Español"},
                new Asignatura{Nombre="Ciencias Naturales"} 
            };
            ViewBag.Fecha=DateTime.Now;
            return View(listaAsignaturas);//View("MultiAsignatura",listaAsignaturas);
        }
    }
}