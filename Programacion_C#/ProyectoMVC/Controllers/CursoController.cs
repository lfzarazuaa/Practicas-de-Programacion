using System;
using System.Linq;
using System.Collections.Generic;
using Microsoft.AspNetCore.Mvc;
using ProyectoMVC.Models;

namespace ProyectoMVC.Controllers
{
    public class CursoController : Controller
    {
        private EscuelaContext _context { get; set; }
        public CursoController(EscuelaContext context)
        {
            _context=context;
        }
        [Route("Curso/Index")]
        [Route("Curso/Index/{cursoId}")]
        public IActionResult Index(string cursoId)
        {
            if (!string.IsNullOrWhiteSpace(cursoId))
            {
                var curso = from cursos in _context.Cursos
                                 where cursos.Id == cursoId
                                 select cursos;
                var Curso= curso.SingleOrDefault();
                if (Curso!=null)
                {   
                    return View(Curso);
                }
            }
            return View("MultiCurso",_context.Cursos);
        }

        public IActionResult MultiCurso()
        {
            ViewBag.Fecha=DateTime.Now;
            return View(_context.Cursos);//View("MultiAsignatura",listaAsignaturas);
        }
    }
}