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
            using var db = new InventoryContext();
            return db.Categories.ToList(); //Regresa la lista con los objetos.
        }

        public static CategoryEntity CategoryById(string id)
        {
            using var db = new InventoryContext(); //Ejecuta dispose (Limpiar memoria) cuando ya no se usa db.
            return db.Categories.ToList().LastOrDefault(c => c.CategoryId == id);//Obtiene solo un elemento por Id.
        }

        public static Business_Response ValidateCreateCategory(CategoryEntity oCategory)
        {
            using var db = new InventoryContext();
            var categories = db.Categories.ToList();
            Business_Response response = new Business_Response();
            CategoryEntity cCategory = (CategoryEntity)oCategory.Clone();

            //Referencia de la categoría

            if (cCategory.CategoryId == null || cCategory.CategoryId.Length < 2)
            {
                cCategory.CategoryId = "";
                response.Error = true;
                response.ErrorMessages.Add("La referencia de la categoría debe ser mayor a 2 caracteres.");
            }

            if (cCategory.CategoryId.Length > 50)
            {
                response.Error = true;
                response.ErrorMessages.Add("La referencia de la categoría debe ser menor a 50 caracteres.");
            }

            if (categories.Where(c => c.CategoryId == cCategory.CategoryId).Any())
            {
                response.Error = true;
                response.ErrorMessages.Add($"La referencia de la categoría {cCategory.CategoryId} ya existe.");
            }

            //Nombre de la categoría.

            if (cCategory.CategoryName == null || cCategory.CategoryName.Length < 2)
            {
                cCategory.CategoryName = "";
                response.Error = true;
                response.ErrorMessages.Add("El nombre de la categoría debe ser mayor a 1 caracter.");
            }

            if (cCategory.CategoryName.Length > 100)
            {
                response.Error = true;
                response.ErrorMessages.Add("El nombre de la categoría debe ser menor a 100 caracteres.");
            }

            if (categories.Where(c => c.CategoryName == cCategory.CategoryName).Any())
            {
                response.Error = true;
                response.ErrorMessages.Add($"El nombre de la categoría {cCategory.CategoryName} ya existe.");
            }

            return response;
        }

        public static void CreateCategory(CategoryEntity oCategory)
        {
            using var db = new InventoryContext();
            db.Categories.Add(oCategory); //Agrega el elemento al contexto.
            db.SaveChanges(); //Agrega a la base de datos.
        }

        public static Business_Response ValidateUpdateCategory(CategoryEntity oCategory)
        {
            using var db = new InventoryContext();
            var categories = db.Categories.ToList();
            Business_Response response = new Business_Response();
            CategoryEntity cCategory = (CategoryEntity)oCategory.Clone();

            //Nombre de la categoría.

            if (cCategory.CategoryName == null || cCategory.CategoryName.Length < 2)
            {
                cCategory.CategoryName = "";
                response.Error = true;
                response.ErrorMessages.Add("El nombre de la categoría debe ser mayor a 1 caracter.");
            }

            if (cCategory.CategoryName.Length > 100)
            {
                response.Error = true;
                response.ErrorMessages.Add("El nombre de la categoría debe ser menor a 100 caracteres.");
            }

            if (categories.Where(c => (c.CategoryId != cCategory.CategoryId) && (c.CategoryName == cCategory.CategoryName)).Any())
            {
                response.Error = true;
                response.ErrorMessages.Add($"El nombre de la categoría {cCategory.CategoryName} ya existe.");
            }

            return response;
        }

        public static void UpdateCategory(CategoryEntity oCategory)
        {
            using var db = new InventoryContext(); //Ejecuta dispose (Limpiar memoria) cuando ya no se usa db. 
            db.Categories.Update(oCategory); //Actualiza el valor en el objeto.
            db.SaveChanges(); //Actualiza el objeto en la base de datos.
        }
    }
}
