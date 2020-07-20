﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace Entities
{
    public class WarehouseEntity : ICloneable
    {
        [Key]
        [StringLength(50)]
        public string WarehouseId { get; set; }
        [Required]
        [StringLength(100)]
        public string WarehouseName { get; set; }
        [Required]
        [StringLength(100)]
        public string WarehouseAddress { get; set; }
        public ICollection<StorageEntity> Storages { get; set; } //Lista con todos los almacenes existentes.

        public object Clone()
        {
            return this.MemberwiseClone();
        }
    }
}
