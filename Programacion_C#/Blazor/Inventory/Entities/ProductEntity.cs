using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace Entities
{
    public class ProductEntity
    {
        [Key]
        [StringLength(10)]
        public string ProductId { get; set; }
        [Required]
        [StringLength(100)]
        public string ProductName { get; set; }
        [StringLength(600)]
        public string ProductDescription { get; set; }
        public int TotalQuantity { get; set; }
        public string CategoryId { get; set; } //Identificador de la categoria.
        public CategoryEntity Category { get; set; }//Objeto que contiene a la categoria.
        public ICollection<StorageEntity> Storages { get; set; }//Lista con todos los almacenes.

    }
}
