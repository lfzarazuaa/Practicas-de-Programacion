using DataAccess;
using Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.VisualBasic;
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
            return db.Products.Include(s => s.Category).ToList(); //Regresa la lista con los objetos.
        }

        public static ProductEntity ProductById(string id)
        {
            using var db = new InventoryContext(); //Ejecuta dispose (Limpiar memoria) cuando ya no se usa db.
            return db.Products.ToList().LastOrDefault(p => p.ProductId == id);//Obtiene solo un elemento por Id.
        }

        public static Business_Response ValidateCreateProduct(ProductEntity oProduct)
        {
            using var db = new InventoryContext();
            var products = db.Products.ToList();
            Business_Response response = new Business_Response();
            ProductEntity cProduct = (ProductEntity)oProduct.Clone();
            //Referencia
            if (cProduct.ProductId==null || cProduct.ProductId.Length < 2)
            {
                cProduct.ProductId = "";
                response.Error = true;
                response.ErrorMessages.Add("La referencia del producto debe ser mayor a 2 caracteres.");
            }

            if (cProduct.ProductId.Length>10)
            {
                response.Error = true;
                response.ErrorMessages.Add("La referencia del producto debe ser menor a 10 caracteres.");
            }
            
            if (products.Where(p => p.ProductId == cProduct.ProductId).Any())
            {
                response.Error = true;
                response.ErrorMessages.Add($"La referencia del producto {cProduct.ProductId} ya existe.");
            }

            //Nombre del producto.
            if (products.Where(p => p.ProductName == cProduct.ProductName).Any())
            {
                response.Error = true;
                response.ErrorMessages.Add($"El nombre del producto {cProduct.ProductName} ya existe.");
            }

            if (cProduct.ProductName == null || cProduct.ProductName.Length < 2)
            {
                cProduct.ProductName = "";
                response.Error = true;
                response.ErrorMessages.Add("El nombre del producto debe ser mayor a 1 caracter.");
            }

            if (cProduct.ProductName.Length > 100)
            {
                response.Error = true;
                response.ErrorMessages.Add("El nombre del producto debe ser menor a 100 caracteres.");
            }

            //Descripción del producto.
            if (cProduct.ProductDescription == null)
            {
                cProduct.ProductDescription = "";
            }

            if (cProduct.ProductDescription.Length > 600)
            {
                response.Error = true;
                response.ErrorMessages.Add("La descripción del producto debe ser menor a 600 caracteres.");
            }

            if (!db.Categories.Where(c => c.CategoryId == cProduct.CategoryId).Any())
            {
                response.Error = true;
                response.ErrorMessages.Add($"La referencia de la categoría {cProduct.CategoryId} no existe.");
            }

            return response;
        }

        public static void CreateProduct(ProductEntity cProduct)
        {
            using var db = new InventoryContext();
            db.Products.Add(cProduct); //Agrega el elemento al contexto.
            db.SaveChanges(); //Agrega a la base de datos.
        }

        public static Business_Response ValidateUpdateProduct(ProductEntity oProduct)
        {
            using var db = new InventoryContext();
            var products = db.Products.ToList();
            Business_Response response = new Business_Response();
            ProductEntity cProduct = (ProductEntity) oProduct.Clone();

            //Nombre del producto.
            if (products.Where(p => (p.ProductId != cProduct.ProductId) && (p.ProductName == cProduct.ProductName)).Any())
            {
                response.Error = true;
                response.ErrorMessages.Add($"El nombre del producto {cProduct.ProductName} ya existe.");
            }

            if (cProduct.ProductName == null || cProduct.ProductName.Length < 2)
            {
                cProduct.ProductName = "";
                response.Error = true;
                response.ErrorMessages.Add("El nombre del producto debe ser mayor a 1 caracter.");
            }

            if (cProduct.ProductName.Length > 100)
            {
                response.Error = true;
                response.ErrorMessages.Add("El nombre del producto debe ser menor a 100 caracteres.");
            }

            //Descripción del producto.
            if (cProduct.ProductDescription == null)
            {
                cProduct.ProductDescription = "";
            }

            if (cProduct.ProductDescription.Length > 600)
            {
                response.Error = true;
                response.ErrorMessages.Add("La descripción del producto debe ser menor a 600 caracteres.");
            }

            if (!db.Categories.Where(c => c.CategoryId == cProduct.CategoryId).Any())
            {
                response.Error = true;
                response.ErrorMessages.Add($"La referencia de la categoría {cProduct.CategoryId} no existe.");
            }

            return response;
        }

        public static void UpdateProduct(ProductEntity cProduct)
        {
            using var db = new InventoryContext(); //Ejecuta dispose (Limpiar memoria) cuando ya no se usa db. 
            db.Products.Update(cProduct); //Actualiza el valor en el objeto.
            db.SaveChanges(); //Actualiza el objeto en la base de datos.
        }
    }
}
