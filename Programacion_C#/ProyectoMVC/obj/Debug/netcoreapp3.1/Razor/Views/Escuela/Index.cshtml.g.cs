#pragma checksum "C:\Users\lfzar\Documents\Luis Fernando Zarazua Aguilar\git\Practicas-de-Programacion\Programacion_C#\ProyectoMVC\Views\Escuela\Index.cshtml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "46ecbf4bb238ac07650b52c6b779ee0a34ac9694"
// <auto-generated/>
#pragma warning disable 1591
[assembly: global::Microsoft.AspNetCore.Razor.Hosting.RazorCompiledItemAttribute(typeof(AspNetCore.Views_Escuela_Index), @"mvc.1.0.view", @"/Views/Escuela/Index.cshtml")]
namespace AspNetCore
{
    #line hidden
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Threading.Tasks;
    using Microsoft.AspNetCore.Mvc;
    using Microsoft.AspNetCore.Mvc.Rendering;
    using Microsoft.AspNetCore.Mvc.ViewFeatures;
#nullable restore
#line 1 "C:\Users\lfzar\Documents\Luis Fernando Zarazua Aguilar\git\Practicas-de-Programacion\Programacion_C#\ProyectoMVC\Views\_ViewImports.cshtml"
using ProyectoMVC;

#line default
#line hidden
#nullable disable
#nullable restore
#line 2 "C:\Users\lfzar\Documents\Luis Fernando Zarazua Aguilar\git\Practicas-de-Programacion\Programacion_C#\ProyectoMVC\Views\_ViewImports.cshtml"
using ProyectoMVC.Models;

#line default
#line hidden
#nullable disable
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"46ecbf4bb238ac07650b52c6b779ee0a34ac9694", @"/Views/Escuela/Index.cshtml")]
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"6d7733f763e0ce8a92869d9d460587be1cbdb046", @"/Views/_ViewImports.cshtml")]
    public class Views_Escuela_Index : global::Microsoft.AspNetCore.Mvc.Razor.RazorPage<Escuela>
    {
        #pragma warning disable 1998
        public async override global::System.Threading.Tasks.Task ExecuteAsync()
        {
#nullable restore
#line 2 "C:\Users\lfzar\Documents\Luis Fernando Zarazua Aguilar\git\Practicas-de-Programacion\Programacion_C#\ProyectoMVC\Views\Escuela\Index.cshtml"
  
    ViewData["Title"] = "Información Escuela";
    Layout = "_LayoutSimple";

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n<h1>Página: ");
#nullable restore
#line 7 "C:\Users\lfzar\Documents\Luis Fernando Zarazua Aguilar\git\Practicas-de-Programacion\Programacion_C#\ProyectoMVC\Views\Escuela\Index.cshtml"
       Write(ViewData["Title"]);

#line default
#line hidden
#nullable disable
            WriteLiteral("</h1>\r\n<h1>Escuela: ");
#nullable restore
#line 8 "C:\Users\lfzar\Documents\Luis Fernando Zarazua Aguilar\git\Practicas-de-Programacion\Programacion_C#\ProyectoMVC\Views\Escuela\Index.cshtml"
        Write(Model.UniqueId);

#line default
#line hidden
#nullable disable
            WriteLiteral("</h1>\r\n<h2>Nombre: ");
#nullable restore
#line 9 "C:\Users\lfzar\Documents\Luis Fernando Zarazua Aguilar\git\Practicas-de-Programacion\Programacion_C#\ProyectoMVC\Views\Escuela\Index.cshtml"
       Write(Model.Nombre);

#line default
#line hidden
#nullable disable
            WriteLiteral("</h2>\r\n<h3>Tipo de Escuela: ");
#nullable restore
#line 10 "C:\Users\lfzar\Documents\Luis Fernando Zarazua Aguilar\git\Practicas-de-Programacion\Programacion_C#\ProyectoMVC\Views\Escuela\Index.cshtml"
                Write(Model.TipoEscuela);

#line default
#line hidden
#nullable disable
            WriteLiteral("</h3>\r\n<address>\r\n    <p>Dirección: ");
#nullable restore
#line 12 "C:\Users\lfzar\Documents\Luis Fernando Zarazua Aguilar\git\Practicas-de-Programacion\Programacion_C#\ProyectoMVC\Views\Escuela\Index.cshtml"
             Write(Model.Dirección);

#line default
#line hidden
#nullable disable
            WriteLiteral("</p>\r\n    <p>País: ");
#nullable restore
#line 13 "C:\Users\lfzar\Documents\Luis Fernando Zarazua Aguilar\git\Practicas-de-Programacion\Programacion_C#\ProyectoMVC\Views\Escuela\Index.cshtml"
        Write(Model.Pais);

#line default
#line hidden
#nullable disable
            WriteLiteral("</p>\r\n    <p>Ciudad: ");
#nullable restore
#line 14 "C:\Users\lfzar\Documents\Luis Fernando Zarazua Aguilar\git\Practicas-de-Programacion\Programacion_C#\ProyectoMVC\Views\Escuela\Index.cshtml"
          Write(Model.Ciudad);

#line default
#line hidden
#nullable disable
            WriteLiteral("</p>\r\n</address>\r\n<p><strong>Año de fundación: ");
#nullable restore
#line 16 "C:\Users\lfzar\Documents\Luis Fernando Zarazua Aguilar\git\Practicas-de-Programacion\Programacion_C#\ProyectoMVC\Views\Escuela\Index.cshtml"
                        Write(Model.AñoDeCreación);

#line default
#line hidden
#nullable disable
            WriteLiteral("</strong></p>\r\n\r\n<p><strong>View Bag</strong></p>\r\n<p><i>");
#nullable restore
#line 19 "C:\Users\lfzar\Documents\Luis Fernando Zarazua Aguilar\git\Practicas-de-Programacion\Programacion_C#\ProyectoMVC\Views\Escuela\Index.cshtml"
 Write(ViewBag.CosaDinámica);

#line default
#line hidden
#nullable disable
            WriteLiteral("</i></p>\r\n\r\n<p><strong>View Title</strong></p>\r\n<p><i>");
#nullable restore
#line 22 "C:\Users\lfzar\Documents\Luis Fernando Zarazua Aguilar\git\Practicas-de-Programacion\Programacion_C#\ProyectoMVC\Views\Escuela\Index.cshtml"
 Write(ViewData["CosaDinámica"]);

#line default
#line hidden
#nullable disable
            WriteLiteral("</i></p>\r\n\r\n");
        }
        #pragma warning restore 1998
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.ViewFeatures.IModelExpressionProvider ModelExpressionProvider { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.IUrlHelper Url { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.IViewComponentHelper Component { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.Rendering.IJsonHelper Json { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.Rendering.IHtmlHelper<Escuela> Html { get; private set; }
    }
}
#pragma warning restore 1591