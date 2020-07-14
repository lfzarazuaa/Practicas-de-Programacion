using DataAccess;
using Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Business
{
    public class Business_Product
    {
        public static List<ProductEntity> ProductList()
        {
            using var db = new InventoryContext(); //Ejecuta dispose (Limpiar memoria) cuando ya no se usa db. 
            return db.Products.ToList(); //Regresa la lista con los objetos.
        }

        public static void CreateProduct(ProductEntity oProduct)
        {
            using (var db = new InventoryContext()) //Ejecuta dispose (Limpiar memoria) cuando ya no se usa db. 
            {
                db.Products.Add(oProduct); //Agrega el elemento al contexto.
                db.SaveChanges(); //Agrega a la base de datos.
            }
        }

        public static void UpdateProduct(ProductEntity oProduct)
        {
            using var db = new InventoryContext(); //Ejecuta dispose (Limpiar memoria) cuando ya no se usa db. 
            db.Products.Update(oProduct); //Actualiza el valor en el objeto.
            db.SaveChanges(); //Actualiza el objeto en la base de datos.
        }
    }
}
