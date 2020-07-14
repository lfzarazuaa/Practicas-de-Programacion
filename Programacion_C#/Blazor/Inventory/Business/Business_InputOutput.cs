using DataAccess;
using Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Business
{
    public class Business_InputOutput
    {
        public List<InputOutputEntity> InputOutputList()
        {
            using var db = new InventoryContext(); //Ejecuta dispose (Limpiar memoria) cuando ya no se usa db. 
            return db.InputOutputs.ToList(); //Regresa la lista con los objetos.
        }

        public void CreateInputOutput(InputOutputEntity oInputOutput)
        {
            using var db = new InventoryContext(); //Ejecuta dispose (Limpiar memoria) cuando ya no se usa db. 
            db.InputOutputs.Add(oInputOutput); //Agrega el elemento al contexto.
            db.SaveChanges(); //Agrega a la base de datos.
        }

        public void UpdateInputOutput(InputOutputEntity oInputOutput)
        {
            using var db = new InventoryContext(); //Ejecuta dispose (Limpiar memoria) cuando ya no se usa db. 
            db.InputOutputs.Update(oInputOutput); //Actualiza el valor en el objeto.
            db.SaveChanges(); //Actualiza el objeto en la base de datos.
        }
    }
}
