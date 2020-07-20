using DataAccess;
using Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Business
{
    public static class Business_Warehouse
    {
        public static List<WarehouseEntity> WarehouseList()
        {
            using var db = new InventoryContext(); //Ejecuta dispose (Limpiar memoria) cuando ya no se usa db. 
            return db.Warehouses.ToList(); //Regresa la lista con los objetos.
        }

        public static WarehouseEntity WarehouseById(string id)
        {
            using var db = new InventoryContext(); //Ejecuta dispose (Limpiar memoria) cuando ya no se usa db.
            return db.Warehouses.ToList().LastOrDefault(w => w.WarehouseId == id);//Obtiene solo un elemento por Id.
        }
        public static Business_Response ValidateCreateWarehouse(WarehouseEntity oWarehouse)
        {
            using var db = new InventoryContext();
            var warehouses = db.Warehouses.ToList();
            Business_Response response = new Business_Response();
            
            //Referencia
            do
            {
                oWarehouse.WarehouseId = Guid.NewGuid().ToString();//Asigna un identificador a la bodega hasta garantizar que sea único.
            } while (warehouses.Where(w => w.WarehouseId == oWarehouse.WarehouseId).Any());

            WarehouseEntity cWarehouse = (WarehouseEntity)oWarehouse.Clone();

            //Nombre de la bodega.

            if (cWarehouse.WarehouseName == null || cWarehouse.WarehouseName.Length < 2)
            {
                cWarehouse.WarehouseName = "";
                response.Error = true;
                response.ErrorMessages.Add("El nombre de la bodega debe ser mayor a 1 caracter.");
            }

            if (cWarehouse.WarehouseName.Length > 100)
            {
                response.Error = true;
                response.ErrorMessages.Add("El nombre de la bodega debe ser menor a 100 caracteres.");
            }

            if (warehouses.Where(w => w.WarehouseName == cWarehouse.WarehouseName).Any())
            {
                response.Error = true;
                response.ErrorMessages.Add($"El nombre de la bodega {cWarehouse.WarehouseName} ya existe.");
            }

            //Dirección de la bodega.
            if (cWarehouse.WarehouseAddress == null || cWarehouse.WarehouseAddress.Length < 4)
            {
                cWarehouse.WarehouseAddress = "";
                response.Error = true;
                response.ErrorMessages.Add("La dirección de la bodega debe ser mayor a 4 caracteres.");
            }

            if (cWarehouse.WarehouseAddress.Length > 100)
            {
                response.Error = true;
                response.ErrorMessages.Add("La dirección de la bodega debe ser menor a 100 caracteres.");
            }

            if (warehouses.Where(w => w.WarehouseAddress == cWarehouse.WarehouseAddress).Any())
            {
                response.Error = true;
                response.ErrorMessages.Add($"La dirección de la bodega {cWarehouse.WarehouseAddress} ya está registrada.");
            }

            return response;
        }

        public static void CreateWarehouse(WarehouseEntity oWarehouse)
        {
            using var db = new InventoryContext(); //Ejecuta dispose (Limpiar memoria) cuando ya no se usa db. 
            db.Warehouses.Add(oWarehouse); //Agrega el elemento al contexto.
            db.SaveChanges(); //Agrega a la base de datos.
        }

        public static Business_Response ValidateUpdateWarehouse(WarehouseEntity oWarehouse)
        {
            using var db = new InventoryContext();
            var warehouses = db.Warehouses.ToList();
            Business_Response response = new Business_Response();
            WarehouseEntity cWarehouse = (WarehouseEntity)oWarehouse.Clone();

            //Nombre de la bodega.

            if (cWarehouse.WarehouseName == null || cWarehouse.WarehouseName.Length < 2)
            {
                cWarehouse.WarehouseName = "";
                response.Error = true;
                response.ErrorMessages.Add("El nombre de la bodega debe ser mayor a 1 caracter.");
            }

            if (cWarehouse.WarehouseName.Length > 100)
            {
                response.Error = true;
                response.ErrorMessages.Add("El nombre de la bodega debe ser menor a 100 caracteres.");
            }

            if (warehouses.Where(w => (w.WarehouseId != cWarehouse.WarehouseId) &&(w.WarehouseName == cWarehouse.WarehouseName)).Any())
            {
                response.Error = true;
                response.ErrorMessages.Add($"El nombre de la bodega {cWarehouse.WarehouseName} ya existe.");
            }

            //Dirección de la bodega.
            if (cWarehouse.WarehouseAddress == null || cWarehouse.WarehouseAddress.Length < 4)
            {
                cWarehouse.WarehouseAddress = "";
                response.Error = true;
                response.ErrorMessages.Add("La dirección de la bodega debe ser mayor a 4 caracteres.");
            }

            if (cWarehouse.WarehouseAddress.Length > 100)
            {
                response.Error = true;
                response.ErrorMessages.Add("La dirección de la bodega debe ser menor a 100 caracteres.");
            }

            if (warehouses.Where(w => (w.WarehouseId != cWarehouse.WarehouseId) && (w.WarehouseAddress == cWarehouse.WarehouseAddress)).Any())
            {
                response.Error = true;
                response.ErrorMessages.Add($"La dirección de la bodega {cWarehouse.WarehouseAddress} ya está registrada.");
            }

            return response;
        }

        public static void UpdateWarehouse(WarehouseEntity oWarehouse)
        {
            using var db = new InventoryContext(); //Ejecuta dispose (Limpiar memoria) cuando ya no se usa db. 
            db.Warehouses.Update(oWarehouse); //Actualiza el valor en el objeto.
            db.SaveChanges(); //Actualiza el objeto en la base de datos.
        }
    }
}
