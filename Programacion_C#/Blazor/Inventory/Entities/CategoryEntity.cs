using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace Entities
{
    public class CategoryEntity : ICloneable
    {
        [Key]
        [StringLength(50)]
        public string CategoryId { get; set; }
        [Required]
        [StringLength(100)]
        public string CategoryName { get; set; }
        public ICollection<ProductEntity> Products { get; set; } //Lista con todos los productos existentes.

        public object Clone()
        {
            return this.MemberwiseClone();
        }
    }
}
