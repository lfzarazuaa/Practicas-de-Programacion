using DataAccess;
using Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Business
{
    public class Business_Warehouse
    {
        public List<WarehouseEntity> WarehouseList()
        {
            using var db = new InventoryContext(); //Ejecuta dispose (Limpiar memoria) cuando ya no se usa db. 
            return db.Warehouses.ToList(); //Regresa la lista con los objetos.
        }

        public void CreateWarehouse(WarehouseEntity oWarehouse)
        {
            using var db = new InventoryContext(); //Ejecuta dispose (Limpiar memoria) cuando ya no se usa db. 
            db.Warehouses.Add(oWarehouse); //Agrega el elemento al contexto.
            db.SaveChanges(); //Agrega a la base de datos.
        }

        public void UpdateWarehouse(WarehouseEntity oWarehouse)
        {
            using var db = new InventoryContext(); //Ejecuta dispose (Limpiar memoria) cuando ya no se usa db. 
            db.Warehouses.Update(oWarehouse); //Actualiza el valor en el objeto.
            db.SaveChanges(); //Actualiza el objeto en la base de datos.
        }
    }
}
