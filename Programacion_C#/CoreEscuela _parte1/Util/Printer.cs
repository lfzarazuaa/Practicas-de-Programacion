namespace CoreEscuela.Util
{
    public static class Printer
    {
        public static void DibujarLinea(int tamaño = 10)
        {
            System.Console.WriteLine("".PadLeft(tamaño,'='));
        }

        public static void EscribirTítulo(string título)
        {
            título=$"|| {título} ||";
            DibujarLinea(título.Length);
            System.Console.WriteLine(título);
            DibujarLinea(título.Length);
        }

        public static void Beep(int hz,int tiempo=500, int cantidad=1)
        {
            while (cantidad-- > 0)
            {
                System.Console.Beep(hz, tiempo);
            }
        }
    }
}