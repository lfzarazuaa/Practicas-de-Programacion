#pragma checksum "C:\Users\lfzar\Documents\Luis Fernando Zarazua Aguilar\git\Practicas-de-Programacion\Programacion_C#\ProyectoMVC\Views\Asignatura\Index.cshtml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "4cc662e21fc28157b650f2637587fcf52d15799d"
// <auto-generated/>
#pragma warning disable 1591
[assembly: global::Microsoft.AspNetCore.Razor.Hosting.RazorCompiledItemAttribute(typeof(AspNetCore.Views_Asignatura_Index), @"mvc.1.0.view", @"/Views/Asignatura/Index.cshtml")]
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
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"4cc662e21fc28157b650f2637587fcf52d15799d", @"/Views/Asignatura/Index.cshtml")]
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"6d7733f763e0ce8a92869d9d460587be1cbdb046", @"/Views/_ViewImports.cshtml")]
    public class Views_Asignatura_Index : global::Microsoft.AspNetCore.Mvc.Razor.RazorPage<Asignatura>
    {
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_0 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("name", "ObjetoEscuelaSimple", global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
        #line hidden
        #pragma warning disable 0649
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext __tagHelperExecutionContext;
        #pragma warning restore 0649
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperRunner __tagHelperRunner = new global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperRunner();
        #pragma warning disable 0169
        private string __tagHelperStringValueBuffer;
        #pragma warning restore 0169
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperScopeManager __backed__tagHelperScopeManager = null;
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperScopeManager __tagHelperScopeManager
        {
            get
            {
                if (__backed__tagHelperScopeManager == null)
                {
                    __backed__tagHelperScopeManager = new global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperScopeManager(StartTagHelperWritingScope, EndTagHelperWritingScope);
                }
                return __backed__tagHelperScopeManager;
            }
        }
        private global::Microsoft.AspNetCore.Mvc.TagHelpers.PartialTagHelper __Microsoft_AspNetCore_Mvc_TagHelpers_PartialTagHelper;
        #pragma warning disable 1998
        public async override global::System.Threading.Tasks.Task ExecuteAsync()
        {
#nullable restore
#line 2 "C:\Users\lfzar\Documents\Luis Fernando Zarazua Aguilar\git\Practicas-de-Programacion\Programacion_C#\ProyectoMVC\Views\Asignatura\Index.cshtml"
  
    ViewData["Title"] = "Información de Asignatura";
    Layout = "_LayoutSimple";

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n<h1>Página: ");
#nullable restore
#line 7 "C:\Users\lfzar\Documents\Luis Fernando Zarazua Aguilar\git\Practicas-de-Programacion\Programacion_C#\ProyectoMVC\Views\Asignatura\Index.cshtml"
       Write(ViewData["Title"]);

#line default
#line hidden
#nullable disable
            WriteLiteral("</h1>\r\n<strong>Desde la vista normal.</strong>\r\n<p>\r\n    Nombre: ");
#nullable restore
#line 10 "C:\Users\lfzar\Documents\Luis Fernando Zarazua Aguilar\git\Practicas-de-Programacion\Programacion_C#\ProyectoMVC\Views\Asignatura\Index.cshtml"
       Write(Model.Nombre);

#line default
#line hidden
#nullable disable
            WriteLiteral(" <br>\r\n    Id: ");
#nullable restore
#line 11 "C:\Users\lfzar\Documents\Luis Fernando Zarazua Aguilar\git\Practicas-de-Programacion\Programacion_C#\ProyectoMVC\Views\Asignatura\Index.cshtml"
   Write(Model.UniqueId);

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n</p>\r\n\r\n<strong>Desde la vista parcial.</strong>\r\n");
            __tagHelperExecutionContext = __tagHelperScopeManager.Begin("partial", global::Microsoft.AspNetCore.Razor.TagHelpers.TagMode.SelfClosing, "4cc662e21fc28157b650f2637587fcf52d15799d4909", async() => {
            }
            );
            __Microsoft_AspNetCore_Mvc_TagHelpers_PartialTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.TagHelpers.PartialTagHelper>();
            __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_TagHelpers_PartialTagHelper);
            __Microsoft_AspNetCore_Mvc_TagHelpers_PartialTagHelper.Name = (string)__tagHelperAttribute_0.Value;
            __tagHelperExecutionContext.AddTagHelperAttribute(__tagHelperAttribute_0);
            await __tagHelperRunner.RunAsync(__tagHelperExecutionContext);
            if (!__tagHelperExecutionContext.Output.IsContentModified)
            {
                await __tagHelperExecutionContext.SetOutputContentAsync();
            }
            Write(__tagHelperExecutionContext.Output);
            __tagHelperExecutionContext = __tagHelperScopeManager.End();
            WriteLiteral("\r\n<p><i>");
#nullable restore
#line 16 "C:\Users\lfzar\Documents\Luis Fernando Zarazua Aguilar\git\Practicas-de-Programacion\Programacion_C#\ProyectoMVC\Views\Asignatura\Index.cshtml"
 Write(ViewData["Fecha"]);

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
        public global::Microsoft.AspNetCore.Mvc.Rendering.IHtmlHelper<Asignatura> Html { get; private set; }
    }
}
#pragma warning restore 1591
