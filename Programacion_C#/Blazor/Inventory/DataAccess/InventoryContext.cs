using Entities;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Text;

namespace DataAccess
{
    public class InventoryContext:DbContext //Extiende de la clase DbContext.
    {
        public DbSet<ProductEntity> Products { get; set; }//Tabla de productos.
        public DbSet<CategoryEntity> Categories { get; set; }
        public DbSet<InputOutputEntity> InputOutputs { get; set; }
        public DbSet<WarehouseEntity> Warehouses { get; set; }
        public DbSet<StorageEntity> Storages { get; set; }
        protected override void OnConfiguring(DbContextOptionsBuilder options)//
        {
            if (!options.IsConfigured)//Si no hay una conexión establecida.
            {
                options.UseSqlServer("Server=DESKTOP-UORMO40\\SQLEXPRESS; Database=InventoryDb; User Id=sa; Password=letmein;");//Configura la cadena de conexión.
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);//Ejecuta lo que ya se tenía definido previamente para OnModelCreating.

            //Si no hay datos en la tabla CategoryEntity inserta los datos ingresados (default).
            modelBuilder.Entity<CategoryEntity>().HasData(
                new CategoryEntity {CategoryId="AOL", CategoryName="Alimentos de origen animal"},//Categoría de Alimentos de Origen Animal.
                new CategoryEntity {CategoryId="ASH", CategoryName="Aseo Hogar"},//Categoría de Aseo Personal.
                new CategoryEntity {CategoryId="ASP", CategoryName="Aseo Personal"},
                new CategoryEntity {CategoryId="MVL", CategoryName="Equipo de computo móvil"},
                new CategoryEntity {CategoryId="BNC", CategoryName="Bancos de piezas"},
                new CategoryEntity {CategoryId="HGR", CategoryName="Hogar"},
                new CategoryEntity {CategoryId="PRF", CategoryName="Perfumería"},
                new CategoryEntity {CategoryId="SLD", CategoryName="Salud"},
                new CategoryEntity {CategoryId="VDJ", CategoryName="Video Juegos"}
                );

            //Si no hay datos en la tabla CategoryEntity inserta los datos ingresados (default).
            modelBuilder.Entity<ProductEntity>().HasData(
                new ProductEntity { ProductId="CEP-1Y8091", ProductName="Cepillo de dientes", ProductDescription= "Un cepillo de dientes para enjuage bucal.", TotalQuantity=0, CategoryId="ASP" },
                new ProductEntity { ProductId = "CRD-1283", ProductName = "Carne de cerdo", ProductDescription = "Carne de los cerdos del monte", TotalQuantity = 0, CategoryId = "AOL" },
                new ProductEntity { ProductId = "ESC-87067", ProductName = "Escoba", ProductDescription = "Escoba para el hogar", TotalQuantity = 0, CategoryId = "ASH" },
                new ProductEntity { ProductId = "JBN-123456", ProductName = "Jabón Juanito", ProductDescription = "Mi jabón Juanito para el aseo personal ok.", TotalQuantity = 0, CategoryId = "ASP" },
                new ProductEntity { ProductId = "JUV-51658", ProductName = "Globo", ProductDescription = "Globo color naranja", TotalQuantity = 0, CategoryId = "HGR" },
                new ProductEntity { ProductId = "KBJ-6789", ProductName = "Venda", ProductDescription = "Vendaje para uso comercial", TotalQuantity = 0, CategoryId = "SLD" },
                new ProductEntity { ProductId = "KSP-10348", ProductName = "Jafre", ProductDescription = "Perfume marca Jafre", TotalQuantity = 0, CategoryId = "PRF" },
                new ProductEntity { ProductId = "RRR-576894", ProductName = "Game Of War", ProductDescription = "Juego de estrategia naval", TotalQuantity = 0, CategoryId = "VDJ" },
                new ProductEntity { ProductId = "SND-1325", ProductName = "Sandalia", ProductDescription = "Par de Sandalias Blazor", TotalQuantity = 0, CategoryId = "HGR" },
                new ProductEntity { ProductId = "TBC-916313", ProductName = "Tabcin", ProductDescription = "Medicamento efervescente", TotalQuantity = 0, CategoryId = "SLD" }
                );

            //Si no hay datos en la tabla WarehouseEntity inserta los datos ingresados (default).
            modelBuilder.Entity<WarehouseEntity>().HasData(
                new WarehouseEntity {WarehouseId=Guid.NewGuid().ToString(), WarehouseName="Bodega Central", WarehouseAddress="Calle 8 con 23"},
                new WarehouseEntity {WarehouseId=Guid.NewGuid().ToString(), WarehouseName="Bodega Norte", WarehouseAddress="Calle norte con occidente"},
                new WarehouseEntity {WarehouseId=Guid.NewGuid().ToString(), WarehouseName="Bodega del Este", WarehouseAddress="Cerro de la estrella #455"},
                new WarehouseEntity {WarehouseId=Guid.NewGuid().ToString(), WarehouseName="Bodega del Oeste", WarehouseAddress= "Calle 5 con 48" },
                new WarehouseEntity {WarehouseId=Guid.NewGuid().ToString(), WarehouseName="Eje Central de Abasto", WarehouseAddress= "Miramontes #227" }
                );

        }
    }
}
