using System;
using System.Linq;
using System.Collections.Generic;
using Microsoft.AspNetCore.Mvc;
using ProyectoMVC.Models;

namespace ProyectoMVC.Controllers
{
    public class AsignaturaController : Controller
    {
        private EscuelaContext _context { get; set; }
        public AsignaturaController(EscuelaContext context)
        {
            _context=context;
        }
        public IActionResult Index()
        {
            var asignatura = _context.Asignaturas.FirstOrDefault();
            return View(asignatura);
        }

        public IActionResult MultiAsignatura()
        {
            ViewBag.Fecha=DateTime.Now;
            return View(_context.Asignaturas);//View("MultiAsignatura",listaAsignaturas);
        }
    }
}