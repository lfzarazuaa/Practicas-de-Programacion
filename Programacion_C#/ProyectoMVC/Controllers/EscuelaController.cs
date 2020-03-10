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
                Nombre = "Escuela ESANS"
            };
            ViewBag.CosaDinámica="Texto Dinámico";
            return View(escuela);
        }
    }
}