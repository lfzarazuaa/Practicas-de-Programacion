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
        [Route("Asignatura/Index")]
        [Route("Asignatura/Index/{asignaturaId}")]
        public IActionResult Index(string asignaturaId)
        {
            if (!string.IsNullOrWhiteSpace(asignaturaId))
            {
                var asignatura = from asig in _context.Asignaturas
                                 where asig.Id == asignaturaId
                                 select asig;
                var Asignatura= asignatura.SingleOrDefault();
                if (Asignatura!=null)
                {   
                    return View(Asignatura);
                }
            }
            return View("MultiAsignatura",_context.Asignaturas);
        }

        public IActionResult MultiAsignatura()
        {
            ViewBag.Fecha=DateTime.Now;
            return View(_context.Asignaturas);//View("MultiAsignatura",listaAsignaturas);
        }
    }
}