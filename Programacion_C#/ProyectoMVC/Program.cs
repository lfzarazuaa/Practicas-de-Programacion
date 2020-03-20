using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using ProyectoMVC.Models;

namespace ProyectoMVC
{
    public class Program
    {
        public static void Main(string[] args)
        {
            //CreateHostBuilder(args).Build().Run();//Crea el webservice.
            var host = CreateHostBuilder(args).Build();//Se construye el objeto para luego ejecutarlo.
            //Garantizar que los datos ya hayan sido creados.
            using (var scope = host.Services.CreateScope())//Una vez creado el servicio finaliza el looger.
            {
                //Lee las lista de servicios.
                var services = scope.ServiceProvider; //Trae todos los servicios.
                                                      //Extraer servicio data context.
                var context = services.GetRequiredService<EscuelaContext>();
                try
                {
                    context.Database.EnsureCreated();//Falla si no hay conexión a la base de datos. 
                }
                catch (Exception ex)
                {
                    var logger = services.GetRequiredService<ILogger<Program>>();
                    logger.LogError(ex, "Ocurrió un error al acceder a la base de datos.");
                }
            }
            host.Run();

        }

        public static IHostBuilder CreateHostBuilder(string[] args) =>
            Host.CreateDefaultBuilder(args)
                .ConfigureWebHostDefaults(webBuilder =>
                {
                    webBuilder.UseStartup<Startup>();
                });
    }
}
