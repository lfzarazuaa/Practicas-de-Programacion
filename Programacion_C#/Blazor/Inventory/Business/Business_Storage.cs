using DataAccess;
using Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Business
{
    public class Business_Storage
    {
        public List<StorageEntity> StorageList()
        {
            using var db = new InventoryContext(); //Ejecuta dispose (Limpiar memoria) cuando ya no se usa db. 
            return db.Storages.ToList(); //Regresa la lista con los objetos.
        }

        public void CreateStorage(StorageEntity oStorage)
        {
            using var db = new InventoryContext(); //Ejecuta dispose (Limpiar memoria) cuando ya no se usa db. 
            db.Storages.Add(oStorage); //Agrega el elemento al contexto.
            db.SaveChanges(); //Agrega a la base de datos.
        }

        public void UpdateStorage(StorageEntity oStorage)
        {
            using var db = new InventoryContext(); //Ejecuta dispose (Limpiar memoria) cuando ya no se usa db. 
            db.Storages.Update(oStorage); //Actualiza el valor en el objeto.
            db.SaveChanges(); //Actualiza el objeto en la base de datos.
        }
    }
}
