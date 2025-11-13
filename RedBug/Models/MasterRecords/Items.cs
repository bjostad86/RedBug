using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace RedBug.Models.MasterRecords
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
        [Column(TypeName = "int")]
        public int TypeID { get; set; }
        
        [Required]
        [DisplayName("Name")]
        [Column(TypeName = "varchar(50)")]
        public string Name { get; set; }
        
        [Column(TypeName = "varchar(500)")]
        public string? Description { get; set; }
        
        [Required]
        [Column(TypeName = "varchar(1)")]
        public string Status { get; set; }
        
        [Required]
        [DisplayName("Division")]
        [Column(TypeName = "int")]
        public int DivisionID { get; set; }
        
        
        
        
        
        
        [Column(TypeName = "varchar(50)")]
        public string? RecordLockedUser { get; set; }
        
        [Column(TypeName = "datetime")]
        public DateTime? RecordLockedTime { get; set; }
    }
    
    [PrimaryKey(nameof(ID))]
    public class ItemTypes
    {
        [Required]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Column(TypeName = "int")]
        public int ID { get; set; }
        
        [Required]
        [Column(TypeName = "varchar(25)")]
        public string Type { get; set; }
    }
}