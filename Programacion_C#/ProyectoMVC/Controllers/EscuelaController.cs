using System;
using System.Linq;
using Microsoft.AspNetCore.Mvc;
using ProyectoMVC.Models;

namespace ProyectoMVC.Controllers
{
    public class EscuelaController : Controller
    {
        private EscuelaContext _context { get; set; }
        
        public EscuelaController(EscuelaContext context)
        {
            _context=context;
        }

        public IActionResult Index()
        {
            // var escuela = new Escuela(){
            //     AñoDeCreación=2005,
            //     Nombre = "Escuela ESANS",
            //     Dirección = "Guanabana #137",
            //     Pais = "México",
            //     Ciudad = "Ciudad de México",
            //     TipoEscuela = TiposEscuela.Secundaria
            // };
            ViewBag.CosaDinámica="Texto Dinámico";
            var escuela =_context.Escuelas.FirstOrDefault();
            return View(escuela);
        }

    }
}