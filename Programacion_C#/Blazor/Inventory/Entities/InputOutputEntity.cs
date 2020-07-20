using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace Entities
{
    public class InputOutputEntity : ICloneable
    {
        [Key]
        [StringLength(50)]
        public string InputOutputId { get; set; }
        [Required]
        public DateTime InputOutputDate { get; set; }
        [Required]
        public int Quantity { get; set; }
        [Required]
        public bool IsInput { get; set; }
        public string StorageId { get; set; }//Identificador del almacen.
        public StorageEntity Storage { get; set; }//Objeto con el almacen.

        public object Clone()
        {
            return this.MemberwiseClone();
        }
    }
}
