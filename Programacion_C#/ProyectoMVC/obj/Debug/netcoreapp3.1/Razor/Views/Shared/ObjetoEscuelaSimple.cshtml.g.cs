#pragma checksum "C:\Users\lfzar\Documents\Luis Fernando Zarazua Aguilar\git\Practicas-de-Programacion\Programacion_C#\ProyectoMVC\Views\Shared\ObjetoEscuelaSimple.cshtml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "7c622c8b78ca2069eb68541b4f17125e4b723825"
// <auto-generated/>
#pragma warning disable 1591
[assembly: global::Microsoft.AspNetCore.Razor.Hosting.RazorCompiledItemAttribute(typeof(AspNetCore.Views_Shared_ObjetoEscuelaSimple), @"mvc.1.0.view", @"/Views/Shared/ObjetoEscuelaSimple.cshtml")]
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
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"7c622c8b78ca2069eb68541b4f17125e4b723825", @"/Views/Shared/ObjetoEscuelaSimple.cshtml")]
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"6d7733f763e0ce8a92869d9d460587be1cbdb046", @"/Views/_ViewImports.cshtml")]
    public class Views_Shared_ObjetoEscuelaSimple : global::Microsoft.AspNetCore.Mvc.Razor.RazorPage<ObjetoEscuelaBase>
    {
        #pragma warning disable 1998
        public async override global::System.Threading.Tasks.Task ExecuteAsync()
        {
            WriteLiteral("\n<p>\n    Nombre: ");
#nullable restore
#line 4 "C:\Users\lfzar\Documents\Luis Fernando Zarazua Aguilar\git\Practicas-de-Programacion\Programacion_C#\ProyectoMVC\Views\Shared\ObjetoEscuelaSimple.cshtml"
       Write(Model.Nombre);

#line default
#line hidden
#nullable disable
            WriteLiteral(" <br>\n    Id: ");
#nullable restore
#line 5 "C:\Users\lfzar\Documents\Luis Fernando Zarazua Aguilar\git\Practicas-de-Programacion\Programacion_C#\ProyectoMVC\Views\Shared\ObjetoEscuelaSimple.cshtml"
   Write(Model.UniqueId);

#line default
#line hidden
#nullable disable
            WriteLiteral("\n</p>");
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
        public global::Microsoft.AspNetCore.Mvc.Rendering.IHtmlHelper<ObjetoEscuelaBase> Html { get; private set; }
    }
}
#pragma warning restore 1591