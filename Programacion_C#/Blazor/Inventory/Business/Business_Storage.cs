using DataAccess;
using Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.EntityFrameworkCore;

namespace Business
{
    public class Business_Storage
    {
        public static List<StorageEntity> StorageList()
        {
            using var db = new InventoryContext(); //Ejecuta dispose (Limpiar memoria) cuando ya no se usa db. 
            return db.Storages
                .Include(s => s.Product)
                .Include(s => s.Product.Category)
                .Include(s => s.Warehouse)
                .Where(s => s.StorageId == s.StorageId)
                .OrderBy(s => s.Warehouse.WarehouseName).ThenBy(s=>s.Product.ProductName)
                .ToList(); //Regresa la lista con los objetos.
        }

        public static List<StorageEntity> StoragesProductsByWarehouse(string idWarehouse)
        {
            using var db = new InventoryContext(); //Ejecuta dispose (Limpiar memoria) cuando ya no se usa db. 
            return db.Storages
                .Include(s => s.Product)//Objeto relacional Product.
                .Include(s => s.Product.Category)//Objeto relacional Category.
                .Include(s => s.Warehouse)//Objeto relacional Warehouse.
                .Where(s => s.WarehouseId == idWarehouse)//Sentencia Where para definir condiciones de búsqueda.
                .OrderBy(s => s.Product.ProductName)
                .ToList();
        }

        public static StorageEntity StorageById(string id)
        {
            using var db = new InventoryContext(); //Ejecuta dispose (Limpiar memoria) cuando ya no se usa db.
            return db.Storages.ToList().LastOrDefault(s => s.StorageId == id);//Obtiene solo un elemento por Id.
        }

        public static Business_Response ValidateCreateStorage(StorageEntity oStorage)
        {
            using var db = new InventoryContext();
            var storages = db.Storages.ToList();
            Business_Response response = new Business_Response();

            //Referencia
            do
            {
                oStorage.StorageId = Guid.NewGuid().ToString();//Asigna un identificador a la bodega hasta garantizar que sea único.
            } while (storages.Where(st => st.StorageId == oStorage.StorageId).Any());

            //Asignar la hora actual.
            oStorage.LastUpdate = DateTime.Now;
            oStorage.PartialQuantity = 0;

            StorageEntity cStorage = (StorageEntity)oStorage.Clone();

            //Identificador del producto válido.
            if (!db.Products.Where(p => p.ProductId == cStorage.ProductId).Any())
            {
                response.Error = true;
                response.ErrorMessages.Add($"La referencia del producto seleccionado no existe.");
            }

            //Identificador de la bodega válido.
            if (!db.Warehouses.Where(w => w.WarehouseId == cStorage.WarehouseId).Any())
            {
                response.Error = true;
                response.ErrorMessages.Add($"La referencia de la bodega seleccionada no existe.");
            }

            //Producto en Bodega
            if (storages.Where(st => (st.WarehouseId == oStorage.WarehouseId) && (st.ProductId == oStorage.ProductId)).Any())
            {//Si ya está registrado el producto en esa bodega no lo almacena nuevamente.
                response.Error = true;
                var storage=db.Storages.Include(s => s.Product).Include(s => s.Warehouse).Where(st =>(st.WarehouseId == oStorage.WarehouseId) && (st.ProductId == oStorage.ProductId)).ToList().LastOrDefault(s=> true);
                response.ErrorMessages.Add($"El producto {storage.Product.ProductName} ya existe en la bodega {storage.Warehouse.WarehouseName}.");
            }

            return response;
        }

        public static void CreateStorage(StorageEntity oStorage)
        {
            using var db = new InventoryContext(); //Ejecuta dispose (Limpiar memoria) cuando ya no se usa db. 
            db.Storages.Add(oStorage); //Agrega el elemento al contexto.
            db.SaveChanges(); //Agrega a la base de datos.
        }

        public static bool IsProductInWarehouse(string idStorage)
        {
            using var db = new InventoryContext(); //Ejecuta dispose (Limpiar memoria) cuando ya no se usa db.
            var product = db.Storages.ToList().Where(st => st.StorageId == idStorage);//Guarda el producto de la base de datos en la variable product si existe el id del producto en la tabla de almacenamiento.
            return product.Any();//Devuelve si existe algún objeto que cumpla con el Id.
        }

        public static void UpdateStorage(StorageEntity oStorage)
        {
            using var db = new InventoryContext(); //Ejecuta dispose (Limpiar memoria) cuando ya no se usa db. 
            db.Storages.Update(oStorage); //Actualiza el valor en el objeto.
            db.SaveChanges(); //Actualiza el objeto en la base de datos.
        }
    }
}
