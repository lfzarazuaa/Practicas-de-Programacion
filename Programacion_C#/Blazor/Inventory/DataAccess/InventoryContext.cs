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
                new CategoryEntity {CategoryId="ASH", CategoryName="Aseo Hogar"},//Catergoria de Aseo Personal.
                new CategoryEntity {CategoryId="ASP", CategoryName="Aseo Personal"},
                new CategoryEntity {CategoryId="HGR", CategoryName="Hogar"},
                new CategoryEntity {CategoryId="PRF", CategoryName="Perfumería"},
                new CategoryEntity {CategoryId="SLD", CategoryName="Salud"},
                new CategoryEntity {CategoryId="VDJ", CategoryName="Video Juegos"}
                );
            //Si no hay datos en la tabla WarehouseEntity inserta los datos ingresados (default).
            modelBuilder.Entity<WarehouseEntity>().HasData(
                new WarehouseEntity {WarehouseId=Guid.NewGuid().ToString(), WarehouseName="Bodega Cental", WarehouseAddress="Calle 8 con 23"},
                new WarehouseEntity {WarehouseId=Guid.NewGuid().ToString(), WarehouseName="Bodega Norte", WarehouseAddress="Calle norte con occidente"},
                new WarehouseEntity {WarehouseId=Guid.NewGuid().ToString(), WarehouseName="Bodega Cental", WarehouseAddress="Calle 8 con 23"}
                );

        }
    }
}
