using Entities;
using System;
using System.Collections.Generic;
using System.Text;
using DataAccess;
using System.Linq;

namespace Business
{
    public class Business_Category
    {
        public static List<CategoryEntity> CategoryList()
        {
            using (var db = new InventoryContext()) //Ejecuta dispose (Limpiar memoria) cuando ya no se usa db. 
            {
                return db.Categories.ToList(); //Regresa la lista con los objetos.
            }
        }

        public static void CreateCategory(CategoryEntity oCategory)
        {
            using (var db = new InventoryContext()) //Ejecuta dispose (Limpiar memoria) cuando ya no se usa db. 
            {
                db.Categories.Add(oCategory); //Agrega el elemento al contexto.
                db.SaveChanges(); //Agrega a la base de datos.
            }
        }

        public static void UpdateCategory(CategoryEntity oCategory)
        {
            using var db = new InventoryContext(); //Ejecuta dispose (Limpiar memoria) cuando ya no se usa db. 
            db.Categories.Update(oCategory); //Actualiza el valor en el objeto.
            db.SaveChanges(); //Actualiza el objeto en la base de datos.
        }
    }
}
