using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace Common.Models.MasterRecords
{
    [PrimaryKey(nameof(ID))]
    public class Items
    {
        [Required]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Column(TypeName = "int")]
        public int ID { get; set; }
        
        [Required]
        [DisplayName("Item Type")]
        [Column(TypeName = "varchar(25)")]
        public string Type { get; set; }
        
        [Required]
        [DisplayName("Name")]
        [Column(TypeName = "varchar(50)")]
        public string Description { get; set; }
        
        [Column(TypeName = "varchar(500)")]
        public string? DescriptionExtended { get; set; }
        
        [Required]
        [Column(TypeName = "varchar(1)")]
        public string Status { get; set; }
        
        [Required]
        [DisplayName("Division")]
        [Column(TypeName = "int")]
        public int DivisionID { get; set; }
        
        [Column(TypeName = "varchar(25)")]
        public string? GlAccount { get; set; }
        
        [Column(TypeName = "varchar(14)")]
        public string? GTIN { get; set; }
        
        [Column(TypeName = "varchar(12)")]
        public string? UPC { get; set; }
        
        [Column(TypeName = "decimal(12,4)")]
        public decimal? Weight { get; set; }
        
        [Required]
        [DisplayName("Unit of Measure")]
        [Column(TypeName = "varchar(3)")]
        public string Uom { get; set; }
        
        [DisplayName("Price Code")]
        [Column(TypeName = "varchar(25)")]
        public string? PriceCode { get; set; }
    }
    
    [PrimaryKey(nameof(SID))]
    public class ItemTypes
    {
        [Required]
        [Column(TypeName = "varchar(25)")]
        public string SID { get; set; }
        
        [Required]
        [Column(TypeName = "varchar(150)")]
        public string Description { get; set; }
    }
}