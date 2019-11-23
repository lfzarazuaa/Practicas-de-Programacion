namespace CoreEscuela.Entidades
{
    public class AlumnoPromedio
    {
        public string AlumnoId;
        public string Nombre;
        public double Promedio;

        public override string ToString(){
            return $" Promedio: {Promedio},Nombre: {Nombre}";
        }                        
    }
}