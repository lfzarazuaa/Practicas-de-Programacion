using DataAccess;
using Entities;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Business
{
    public class Business_InputOutput
    {
        public static List<InputOutputEntity> InputOutputList()
        {
            using var db = new InventoryContext(); //Ejecuta dispose (Limpiar memoria) cuando ya no se usa db. 
            return db.InputOutputs
                .Include(io => io.Storage)//Objeto relacional Storage.
                .Include(io => io.Storage.Product)//Objeto relacional Product.
                .Include(io => io.Storage.Warehouse)//Objeto relacional Warehouse.
                .OrderBy(io => io.Storage.Warehouse.WarehouseName).ThenByDescending(io => io.InputOutputDate)
                .ToList(); //Regresa la lista con los objetos.
        }

        public static List<InputOutputEntity> InputOutputsByWarehouse(string idWarehouse)
        {
            using var db = new InventoryContext(); //Ejecuta dispose (Limpiar memoria) cuando ya no se usa db. 
            return db.InputOutputs
                .Include(io => io.Storage)//Objeto relacional Storage.
                .Include(io => io.Storage.Product)//Objeto relacional Product.
                .Include(io => io.Storage.Warehouse)//Objeto relacional Warehouse.
                .Where(io => io.Storage.Warehouse.WarehouseId == idWarehouse)//Sentencia Where para definir condiciones de búsqueda.
                .OrderBy(io => io.Storage.Warehouse).ThenByDescending(io => io.InputOutputDate)
                .ToList();
        }

        public static InputOutputEntity InputOutputById(string id)
        {
            using var db = new InventoryContext(); //Ejecuta dispose (Limpiar memoria) cuando ya no se usa db.
            return db.InputOutputs.ToList().LastOrDefault(io => io.InputOutputId == id);//Obtiene solo un elemento por Id.
        }

        public static Business_Response ValidateCreateInputOutput(InputOutputEntity oInputOutput)
        {
            using var db = new InventoryContext();
            var inputOutputs = db.InputOutputs.ToList();
            var storages = db.Storages.ToList();
            Business_Response response = new Business_Response();

            //Referencia
            do
            {
                oInputOutput.InputOutputId = Guid.NewGuid().ToString();//Asigna un identificador a la bodega hasta garantizar que sea único.
            } while (inputOutputs.Where(io => io.InputOutputId == oInputOutput.InputOutputId).Any());

            //Asignar la hora actual.
            oInputOutput.InputOutputDate = DateTime.Now;

            InputOutputEntity cInputOutput = (InputOutputEntity)oInputOutput.Clone();

            //Identificador del almacenamiento válido.
            if (!storages.Where(st => st.StorageId == cInputOutput.StorageId).Any())
            {
                response.Error = true;
                response.ErrorMessages.Add($"La referencia del producto seleccionado no existe.");
                if (cInputOutput.Quantity < 1)
                {
                    response.Error = true;
                    response.ErrorMessages.Add($"La cantidad debe ser mayor o igual a 1.");
                }
            }
            else
            {
                var oStorage = storages.LastOrDefault(s => s.StorageId == oInputOutput.StorageId);//Evita volver a leer desde la base de datos Business_Storage.StorageById(oInputOutput.StorageId);
                var oProduct = oStorage.Product;
                if (cInputOutput.Quantity < 1)
                {
                    response.Error = true;
                    response.ErrorMessages.Add($"La cantidad debe ser mayor o igual a 1.");
                }
                else
                {
                    if (!oInputOutput.IsInput && (oInputOutput.Quantity > oStorage.PartialQuantity))
                    {
                        response.Error = true;
                        response.ErrorMessages.Add($"La cantidad a retirar ({oInputOutput.Quantity}) es mayor que la cantidad del almacen ({oStorage.PartialQuantity}).");
                    }
                }
            }
            return response;
        }

        public static void CreateInputOutput(InputOutputEntity oInputOutput)
        {
            using var db = new InventoryContext(); //Ejecuta dispose (Limpiar memoria) cuando ya no se usa db. 
            db.InputOutputs.Add(oInputOutput); //Agrega el elemento al contexto.
            db.SaveChanges(); //Agrega a la base de datos.
        }

        public static void UpdateInputOutput(InputOutputEntity oInputOutput)
        {
            using var db = new InventoryContext(); //Ejecuta dispose (Limpiar memoria) cuando ya no se usa db. 
            db.InputOutputs.Update(oInputOutput); //Actualiza el valor en el objeto.
            db.SaveChanges(); //Actualiza el objeto en la base de datos.
        }
    }
}
