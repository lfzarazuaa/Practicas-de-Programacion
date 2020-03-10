using System;
using Microsoft.AspNetCore.Mvc;
using ProyectoMVC.Models;

namespace ProyectoMVC.Controllers
{
    public class EscuelaController : Controller
    {
        public IActionResult Index()
        {
            var escuela = new Escuela(){
                AñoDeCreación=2005,
                Nombre = "Escuela ESANS",
                Dirección = "Guanabana #137",
                Pais = "México",
                Ciudad = "Ciudad de México",
                TipoEscuela = TiposEscuela.Secundaria
            };
            ViewBag.CosaDinámica="Texto Dinámico";
            return View(escuela);
        }
    }
}