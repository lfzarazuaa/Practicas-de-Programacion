using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace Entities
{
    public class StorageEntity : ICloneable
    {
        [Key]
        [StringLength(50)]
        public string StorageId { get; set; }
        [Required]
        public DateTime LastUpdate { get; set; }
        [Required]
        public int PartialQuantity { get; set; }
        
        public string ProductId { get; set; }//Identificador del producto.
        public ProductEntity Product { get; set; } //Objeto que contiene el producto.

        public string WarehouseId { get; set; }//Identificador de la bodega.
        public WarehouseEntity Warehouse { get; set; } //Objeto que contiene la bodega.
        
        public ICollection<InputOutputEntity> InputOutputs { get; set; } //Lista con todos las entradas/salidas existentes.

        public object Clone()
        {
            return this.MemberwiseClone();
        }
    }
}
