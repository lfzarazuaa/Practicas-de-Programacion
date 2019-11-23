using System;

namespace CoreEscuela.Util
{
    public static class Printer
    {
        public static void DrawLine(int tamaño = 10)
        {
            System.Console.WriteLine("".PadLeft(tamaño,'='));
        }

        public static void WriteTitle(string título)
        {
            título=$"|| {título} ||";
            DrawLine(título.Length);
            System.Console.WriteLine(título);
            DrawLine(título.Length);
        }

        public static void Beep(int hz,int tiempo=500, int cantidad=1)
        {
            while (cantidad-- > 0)
            {
                System.Console.Beep(hz, tiempo);
            }
        }

        internal static void PresioneEnter()
        {
            System.Console.WriteLine("Presione Enter para continuar.");
        }
    }
}